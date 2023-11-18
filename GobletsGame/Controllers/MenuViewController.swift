//
//  MenuViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 20.07.2023.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    let menuView = MenuView()
    var play = UIButton()
    var settings = UIButton()
    var levels = UIButton()
    var statistiks = UIButton()
    
    let backArrowImage = UIImage(named: Resources.Buttons.backArrowImage)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
}
extension MenuViewController {
    private func configure() {
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }
        play = menuView.playButton
        settings = menuView.settingsButton
        levels = menuView.levelsButton
        statistiks = menuView.statisticsButton
        
        
        navigationController?.isNavigationBarHidden = true
        
        play.addTarget(self, action: #selector(levelsPressed), for: .touchUpInside)
        settings.addTarget(self, action: #selector(settingsPressed), for: .touchUpInside)
        levels.addTarget(self, action: #selector(levelsPressed), for: .touchUpInside)
        statistiks.addTarget(self, action: #selector(statistiksPressed), for: .touchUpInside)
    }
    
    @objc func settingsPressed() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @objc func levelsPressed() {
        let levelsConroller = LevelsViewController()
        navigationController?.pushViewController(levelsConroller, animated: true)
    }
    
    @objc func statistiksPressed() {
        let statistiksViewController = StatisticsViewController()
        navigationController?.pushViewController(statistiksViewController, animated: true)
    }


}
