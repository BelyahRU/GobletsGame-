//
//  EnterNameView.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import UIKit

class EnterNameView: UIView {
    
    public let popUpView = UIImageView(image: UIImage(named: Resources.Images.popUpWindowView))

    private let enterYourNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Resources.Fonts.standartFont, size: 28)
        label.text = "ENTER YOUR NAME"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    public var nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "  ENTER YOUR NAME"
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        tf.font = UIFont(name: Resources.Fonts.standartFont, size: 20)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    public var okButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.titleLabel!.font = UIFont(name: Resources.Fonts.standartFont, size: 20)
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .brown
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(popUpView)
        popUpView.addSubview(enterYourNameLabel)
        addSubview(nameTF)
        addSubview(okButton)
        
        popUpView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(161)
        }
        enterYourNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(29)
            make.width.equalTo(260)
        }
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(enterYourNameLabel.snp.bottom).offset(22)
            make.centerX.equalTo(popUpView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(210)
        }
        
        okButton.snp.makeConstraints { make in
            make.centerX.equalTo(popUpView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(75)
            make.top.equalTo(nameTF.snp.bottom).offset(15)
        }
    }
    
}
