//
//  GameViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 23.07.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    private var gameView: GameView!
    
    public var index: Int!
    
    let levels = [level1.layout, level2.layout, level3.layout, level4.layout, level5.layout, level6.layout]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = GameView(frame: self.view.frame)
        gameView.titleImage.image = UIImage(named: "level\(index+1)")
        self.view.addSubview(gameView)
        
        let game = Game(board: Board(layout: levels[index]))
        gameView.delegate = self  // устанавливаем себя в качестве делегата GameView
        gameView.setGame(game)
        game.startGame()
        setupTargets()
    }
    
    private func setupTargets() {
        gameView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension GameViewController: GameDelegate {
    
    func gameDidEndWithVictory() {
        switch index! {
        case 0:
            AppDelegate.shared.isLvl2 = true
        case 1:
            AppDelegate.shared.isLvl3 = true
        case 2:
            AppDelegate.shared.isLvl4 = true
        case 3:
            AppDelegate.shared.isLvl5 = true
        case 4:
            AppDelegate.shared.isLvl6 = true
        default:
            print("")
        }
        let vc = LevelCompletedViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func gameDidEndWithLoss() {
        let loseVC = TimeIsUpViewController()
        navigationController?.pushViewController(loseVC, animated: true)
    }
    
    func updateTimerLabel(with seconds: Int) {
            gameView.timerLabel.text = "00:\(seconds)"
        }
}
