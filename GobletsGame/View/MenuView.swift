//
//  MenuView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 20.07.2023.
//

import Foundation
import UIKit
import SnapKit

class MenuView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Images.backgroundImage))
    private let cupImage = UIImageView(image: UIImage(named: Resources.Images.cupImage))
    var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("PLAY", for: .normal)
        
        return button
    }()
    
    var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("SETTINGS", for: .normal)
        return button
    }()
    
    var levelsButton: UIButton = {
        let button = UIButton()
        button.setTitle("LEVELS", for: .normal)
        return button
    }()
    
    var statisticsButton: UIButton = {
        let button = UIButton()
        button.setTitle("STATISTICS", for: .normal)
        return button
    }()
    
    private var buttonsSV: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
        addSubviewToView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView {
    
    private func addSubviewToView() {
        addSubview(background)
        addSubview(cupImage)
        addSubview(buttonsSV)
    }
    
    private func settings() {
        //background.contentMode = .scaleAspectFit
        //background.clipsToBounds = true
        
        setupButton(playButton)
        setupButton(settingsButton)
        setupButton(levelsButton)
        setupButton(statisticsButton)
        buttonsSV.addArrangedSubview(playButton)
        buttonsSV.addArrangedSubview(settingsButton)
        buttonsSV.addArrangedSubview(levelsButton)
        buttonsSV.addArrangedSubview(statisticsButton)
    }
    
    private func setupButton(_ button: UIButton) {
        button.titleLabel!.font = UIFont(name:"Iceberg-Regular", size: 40)
        button.titleLabel!.textColor = .white
        if button == playButton || button == levelsButton {
            button.setBackgroundImage(UIImage(named: Resources.Buttons.buttonImage2), for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: Resources.Buttons.buttonImage1), for: .normal)
        }
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }
        cupImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(111)
            make.centerX.equalToSuperview()
            make.width.equalTo(222.29)
            //make.width.equalTo(257.571)
            make.height.equalTo(258.907253)
        }
        buttonsSV.snp.makeConstraints { make in
            //make.height.equalTo(336.5)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(400)
            make.width.equalTo(255.45)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(30)
            make.centerX.equalToSuperview()
            //make.top.equalTo(cupImage.snp.bottom).offset(50)
        }
        
        playButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(76.5)
        }
        settingsButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(76.5)
        }
        levelsButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(76.5)
        }
        statisticsButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(76.5)
        }
    }
    
    
}
