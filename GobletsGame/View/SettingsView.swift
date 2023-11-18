//
//  SettingsView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class SettingsView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backArrowImage), for: .normal)
        return button
    }()
    
    private let soundLabel: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Text.soundLabel)
        return im
    }()
    
    private let backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Images.backgroundImage)
        return view
        
    }()
    
    let soundSwitch: UIButton = {
        let swi = UIButton()
        swi.contentMode = .scaleAspectFit
        swi.imageView?.contentMode = .scaleAspectFill
        swi.setImage(UIImage(named: Resources.Buttons.switchOn), for: .normal)
        return swi
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingsView {
    private func configure() {
        addSubview(backgroundView)
        addSubview(soundSwitch)
        addSubview(soundLabel)
        addSubview(backButton)
        
        //soundSwitch.clipsToBounds = true
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(61)
            make.height.equalTo(38)
            make.width.equalTo(22.2)
        }
        
        soundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(49)
            make.top.equalToSuperview().offset(200)
            make.width.equalTo(200)
        }

        soundSwitch.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}
