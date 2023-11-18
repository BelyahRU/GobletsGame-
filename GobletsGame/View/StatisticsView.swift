//
//  StatistiksView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class StatisticsView: UIView {

    
   // public let statisticsArray = Statistics.shared.
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backArrowImage), for: .normal)
        return button
    }()
    private let backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Images.backgroundImage)
        return view
        
    }()
    public let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(StatisticCollectioViewCell.self, forCellWithReuseIdentifier: StatisticCollectioViewCell.reuseId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let statisticsLabel = UIImageView(image: UIImage(named: Resources.Text.statisticsLabel))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StatisticsView {
    private func configure() {
        addSubview(backgroundView)
        addSubview(backButton)
        addSubview(statisticsLabel)
        addSubview(collectionView)

        
       // collectionView.backgroundColor = .black
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(61)
            make.height.equalTo(38)
            make.width.equalTo(22.2)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        statisticsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backButton.snp.centerY)
            make.width.equalTo(200)
        }
        //collectionView.backgroundColor = .blue
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-21)
            make.top.equalTo(statisticsLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(60)
        }
    }
}
