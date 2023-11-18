//
//  Game.swift
//  GobletsGame
//
//  Created by Александр Андреев on 23.07.2023.
//

import UIKit
protocol GameDelegate: AnyObject {
    func gameDidEndWithVictory()
    func gameDidEndWithLoss()
    func updateTimerLabel(with seconds: Int)
}

enum CupColor {
    case gold
    case white
    case empty
}

struct Cup {
    var color: CupColor
}

class Board {
    var cups: [[Cup]]
    
    init(layout: [[CupColor]]) {
        self.cups = layout.map { row in
            row.map { Cup(color: $0) }
        }
    }
    
    func moveCup(to position: (row: Int, column: Int)) {
        guard position.row >= 0, position.row < cups.count,
              position.column >= 0, position.column < cups[0].count,
              cups[position.row][position.column].color != .gold else { // Ограничение на движение по золотым чашкам
            return
        }
        
        cups[position.row][position.column].color = .gold
    }
    
    func findGoldCupPosition() -> (row: Int, column: Int)? {
        for (row, cupsRow) in cups.enumerated() {
            for (column, cup) in cupsRow.enumerated() {
                if cup.color == .gold {
                    return (row, column)
                }
            }
        }
        return nil
    }
    
}

class Game {
    
    let board: Board
    var currentPosition: (row: Int, column: Int)
    
    weak var delegate: GameDelegate?
    
    private var gameTimer: Timer?
    
    var timeRemaining = 60 // Change this to set the game duration
    
    func startGame() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timeRemaining -= 1
            if self?.timeRemaining == 0 {
                self?.lose()
            }
            self?.delegate?.updateTimerLabel(with: self?.timeRemaining ?? 0)
        }
    }
    
    func stopGame() {
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    func lose() {
        stopGame()
        delegate?.gameDidEndWithLoss()
        
    }
    
    func isGameWon() -> Bool {
        for row in board.cups {
            for cup in row {
                if cup.color != .gold && cup.color != .empty {
                    return false
                }
            }
        }
        return true
    }
    
    func win() {
        let levelCompletionTime = 60 - timeRemaining
        
        // Преобразование времени прохождения уровня в формат "00:00".
        let minutes = levelCompletionTime / 60
        let seconds = levelCompletionTime % 60
        let timeString = String(format: "%02d:%02d", minutes, seconds)
        for i in 0...Statistics.shared.resultsArray.count-1 {
            if Statistics.shared.resultsArray[i].name == AppDelegate.shared.userName {
                Statistics.shared.resultsArray[i].time = timeString
            } else {
                AppDelegate.shared.userTime = timeString
            }
        }
        stopGame()
        delegate?.gameDidEndWithVictory()
        print("победа")
    }
    
    init(board: Board) {
        self.board = board
        if let goldCupPosition = board.findGoldCupPosition() {
            self.currentPosition = goldCupPosition
        } else {
            self.currentPosition = (0, 0) // или любое другое значение по умолчанию
        }
    }
    
    func swipe(direction: UISwipeGestureRecognizer.Direction) {
        var nextPosition = currentPosition
        switch direction {
        case .right:
            if nextPosition.column < board.cups[0].count - 1 {
                nextPosition.column += 1
            }
        case .left:
            if nextPosition.column > 0 {
                nextPosition.column -= 1
            }
        case .up:
            if nextPosition.row > 0 {
                nextPosition.row -= 1
            }
        case .down:
            if nextPosition.row < board.cups.count - 1 {
                nextPosition.row += 1
            }
        default:
            return
        }
        
        // Проверка, что следующая позиция не является золотой чашкой
        if board.cups[nextPosition.row][nextPosition.column].color != .gold && board.cups[nextPosition.row][nextPosition.column].color != .empty {
            currentPosition = nextPosition
            board.moveCup(to: currentPosition)
        }
        if isGameWon() {
            win()
        }
    }
}
