//
//  SettingsViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()
    var backButton = UIButton()
    var soundSwitch = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}
extension SettingsViewController {
    
    private func configure() {
        view.addSubview(settingsView)
        settingsView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        backButton = settingsView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        soundSwitch = settingsView.soundSwitch
        soundSwitch.addTarget(self, action: #selector(ofOnSound), for: .touchUpInside)
        
        
    }
    
    @objc func ofOnSound() {
        if soundSwitch.currentImage == UIImage(named: Resources.Buttons.switchOn) {
            soundSwitch.setImage(UIImage(named: Resources.Buttons.switchOff), for: .normal)
        } else {
            soundSwitch.setImage(UIImage(named: Resources.Buttons.switchOn), for: .normal)
        }
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
