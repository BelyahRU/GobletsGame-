//
//  GameView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 23.07.2023.
//



import UIKit

class GameView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var game: Game!
    weak var delegate: GameDelegate?
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        label.textAlignment = .center
        label.text = "00:00"
        return label
    }()
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    private let background = UIImageView(image: UIImage(named: Resources.Images.backgroundImage))
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backArrowImage), for: .normal)
        return button
    }()
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 76, height: 87)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(CupCell.self, forCellWithReuseIdentifier: "CupCell")
        self.addSubview(background)
        self.addSubview(collectionView)
        self.addSubview(backButton)
        self.addSubview(timerLabel)
        self.addSubview(titleImage)
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.up, .down, .left, .right]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gesture.direction = direction
            collectionView.addGestureRecognizer(gesture)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
        }
        
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.bottom.equalToSuperview().offset(-48)
            make.leading.equalToSuperview().offset(41)
            make.trailing.equalToSuperview().offset(-41)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(61)
            make.height.equalTo(38)
            make.width.equalTo(22.2)
        }
        
        background.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGame(_ game: Game) {
        self.game = game
        self.game.delegate = self.delegate  // передаем делегата в Game
        collectionView.reloadData()
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        let initialTouchPoint = gesture.location(in: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: initialTouchPoint),
              let cell = collectionView.cellForItem(at: indexPath),
              game.board.cups[indexPath.section][indexPath.row].color == .gold else {
            return
        }
        
        // сохраняем исходное положение ячейки
        let originalCellFrame = cell.frame
        
        // определяем новое положение ячейки в зависимости от направления свайпа
        var newCellFrame = cell.frame
        switch gesture.direction {
        case .up:
            newCellFrame.origin.y -= cell.frame.height
        case .down:
            newCellFrame.origin.y += cell.frame.height
        case .left:
            newCellFrame.origin.x -= cell.frame.width
        case .right:
            newCellFrame.origin.x += cell.frame.width
        default:
            return
        }
        
        // анимация "свайпа" ячейки
        UIView.animate(withDuration: 0.3, animations: {
            cell.frame = newCellFrame
        }, completion: { _ in
            // возврат ячейки в исходное положение и обновление игры
            UIView.animate(withDuration: 0.1, animations: {
                cell.frame = originalCellFrame
            }, completion: { _ in
                self.game.swipe(direction: gesture.direction)
                self.collectionView.reloadData()
            })
        })
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.board.cups[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CupCell", for: indexPath) as! CupCell
        let cup = game.board.cups[indexPath.section][indexPath.row]
        cell.setImage(for: cup.color)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return game.board.cups.count
    }
}
