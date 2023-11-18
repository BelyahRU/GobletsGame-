//
//  LevelCompletedViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import Foundation
import UIKit

class LevelCompletedViewController: UIViewController {
    
    var completedView = LevelCompletedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupTargets()
    }
    
    func configure() {
        view.addSubview(completedView)
        completedView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupTargets() {
        completedView.menuButton.addTarget(self, action: #selector(goMenu), for: .touchUpInside)
        completedView.nextLevelButton.addTarget(self, action: #selector(goLevels), for: .touchUpInside)
    }
    
    @objc func goMenu() {
        let vc = MenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goLevels() {
        let vc = LevelsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
