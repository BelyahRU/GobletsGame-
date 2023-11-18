//
//  TimeIsUpView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import UIKit

class TimeIsUpView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Images.backgroundImage))
    private let timeIsUpLabel = UIImageView(image: UIImage(named: Resources.Text.timeIsUpLabel))
    private let timeLabel = UIImageView(image: UIImage(named: Resources.Text.timeLabel))
    
    public var playAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("PLAY AGAIN", for: .normal)
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
        button.setBackgroundImage(UIImage(named: Resources.Buttons.buttonImage1), for: .normal)
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
        addSubview(timeLabel)
        addSubview(timeIsUpLabel)
        addSubview(playAgainButton)
        addSubview(menuButton)
        
        background.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(23)
            make.top.equalToSuperview().offset(180)
            make.centerX.equalToSuperview()
        }
        
        timeIsUpLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(35)
            make.width.equalTo(250)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
        }
        
        playAgainButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(255.45)
            make.centerX.equalToSuperview()
            make.top.equalTo(timeIsUpLabel.snp.bottom).offset(200)
        }
        menuButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(255.45)
            make.centerX.equalToSuperview()
            make.top.equalTo(playAgainButton.snp.bottom).offset(10)
        }
    }
}
