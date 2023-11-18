//
//  TimeIsUpViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import UIKit

class TimeIsUpViewController: UIViewController {
    
    let timeIsUpView = TimeIsUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupTargets()
    }
    
    func configure() {
        view.addSubview(timeIsUpView)
        
        timeIsUpView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupTargets() {
        timeIsUpView.menuButton.addTarget(self, action: #selector(goMenu), for: .touchUpInside)
        timeIsUpView.playAgainButton.addTarget(self, action: #selector(goLevels), for: .touchUpInside)
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
