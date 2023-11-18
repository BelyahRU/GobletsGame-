//
//  LevelsView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class LevelsView: UIView {
    
    private let background = UIImageView(image: UIImage(named: Resources.Images.backgroundImage))
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backArrowImage), for: .normal)
        return button
    }()
    
    var firstLevelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.LevelImages.level1open), for: .normal)
        return button
    }()
    var secondLevelButton: UIButton = {
        let button = UIButton()
        if !AppDelegate.shared.isLvl2 {
            button.setImage(UIImage(named: Resources.LevelImages.level2close), for: .normal)
        } else {
            button.setImage(UIImage(named: Resources.LevelImages.level2open), for: .normal)
        }
        return button
    }()
    var thirdLevelButton: UIButton = {
        let button = UIButton()
        if !AppDelegate.shared.isLvl3 {
            button.setImage(UIImage(named: Resources.LevelImages.level3close), for: .normal)
        } else {
            button.setImage(UIImage(named: Resources.LevelImages.level3open), for: .normal)
        }
        return button
    }()
    var fourthLevelButton: UIButton = {
        let button = UIButton()
        if !AppDelegate.shared.isLvl4 {
            button.setImage(UIImage(named: Resources.LevelImages.level4close), for: .normal)
        } else {
            button.setImage(UIImage(named: Resources.LevelImages.level4open), for: .normal)
        }
        return button
    }()
    var fifthLevelButton: UIButton = {
        let button = UIButton()
        if !AppDelegate.shared.isLvl5 {
            button.setImage(UIImage(named: Resources.LevelImages.level5close), for: .normal)
        } else {
            button.setImage(UIImage(named: Resources.LevelImages.level5open), for: .normal)
        }
        return button
    }()
    var sixthLevelButton: UIButton = {
        let button = UIButton()
        if !AppDelegate.shared.isLvl6 {
            button.setImage(UIImage(named: Resources.LevelImages.level6close), for: .normal)
        } else {
            button.setImage(UIImage(named: Resources.LevelImages.level6open), for: .normal)
        }
        return button
    }()
    
    private var sv12: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 70
        sv.distribution = .fillEqually
        return sv
    }()
    
    private var sv34: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 70
        sv.distribution = .fillEqually
        return sv
    }()
    
    private var sv56: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 70
        sv.distribution = .fillEqually
        return sv
    }()
    private var globalSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 40
        sv.distribution = .fillEqually
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setubSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LevelsView {
    private func setubSubviews() {
        addSubview(background)
        addSubview(backButton)
        addSubview(firstLevelButton)
        addSubview(secondLevelButton)
        addSubview(thirdLevelButton)
        addSubview(fourthLevelButton)
        addSubview(fifthLevelButton)
        addSubview(sixthLevelButton)
        addSubview(globalSV)
        globalSV.addArrangedSubview(sv12)
        globalSV.addArrangedSubview(sv34)
        globalSV.addArrangedSubview(sv56)
        sv12.addArrangedSubview(firstLevelButton)
        sv12.addArrangedSubview(secondLevelButton)
        sv34.addArrangedSubview(thirdLevelButton)
        sv34.addArrangedSubview(fourthLevelButton)
        sv56.addArrangedSubview(fifthLevelButton)
        sv56.addArrangedSubview(sixthLevelButton)
        
    }
    
    private func configure() {
        
        
        [fifthLevelButton, secondLevelButton, thirdLevelButton, fourthLevelButton, fifthLevelButton, sixthLevelButton].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(76)
                make.width.equalTo(87)
            }
        }
        
        [sv12, sv34, sv56].forEach {
            $0.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(76)
                
            }
        }
        
        
        globalSV.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(341)
            make.width.equalTo(222)
        }
        
        
        background.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(61)
            make.height.equalTo(38)
            make.width.equalTo(22.2)
        }
    }
}
