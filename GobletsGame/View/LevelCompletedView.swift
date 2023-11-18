//
//  LevelCompleted.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import Foundation
import UIKit

class LevelCompletedView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Images.backgroundImage))
    private let fireworkImage = UIImageView(image: UIImage(named: Resources.Images.fireworkImage))
    private let gobletImage = UIImageView(image: UIImage(named: Resources.Images.cupImage))
    private let levelCompletedLabel = UIImageView(image: UIImage(named: Resources.Text.levelCompletedLabel))
    
    public var nextLevelButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT LEVEL", for: .normal)
        button.titleLabel!.font = UIFont(name:"Iceberg-Regular", size: 40)
        button.titleLabel!.textColor = .white
        button.setBackgroundImage(UIImage(named: Resources.Buttons.buttonImage2), for: .normal)
        return button
    }()
    
    public var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("MENU", for: .normal)
        button.titleLabel!.font = UIFont(name:"Iceberg-Regular", size: 40)
        button.titleLabel!.textColor = .white
        button.setBackgroundImage(UIImage(named: Resources.Buttons.buttonImage2), for: .normal)
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(background)
        addSubview(fireworkImage)
        addSubview(gobletImage)
        addSubview(levelCompletedLabel)
        addSubview(nextLevelButton)
        addSubview(menuButton)

        background.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        fireworkImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(snp.centerY)
        }
        
        gobletImage.snp.makeConstraints { make in
            make.top.equalTo(fireworkImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(120)
            make.trailing.equalToSuperview().inset(120)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(150)
            //make.height.equalTo(210)
            //make.width.equalTo(180)
        }
        
        levelCompletedLabel.snp.makeConstraints { make in
            make.top.equalTo(gobletImage.snp.bottom).offset(20)
            
            make.centerX.equalToSuperview()
            make.height.equalTo(120)
            make.width.equalTo(300)
        }
        
        nextLevelButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(255.45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        menuButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(255.45)
            make.centerX.equalToSuperview()
            make.top.equalTo(nextLevelButton.snp.bottom).offset(10)
        }
    }
}
