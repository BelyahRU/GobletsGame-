//
//  LevelsViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class LevelsViewController: UIViewController {
    
    let levelsView = LevelsView()
    var backButton = UIButton()
    
    var firstLevel = UIButton()
    var secondLevel = UIButton()
    var thirdLevel = UIButton()
    var fourthLevel = UIButton()
    var fifthLevel = UIButton()
    var sixthLevel = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension LevelsViewController {
    
    private func configure() {
        view.addSubview(levelsView)
        levelsView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        backButton = levelsView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        
        firstLevel = levelsView.firstLevelButton
        secondLevel = levelsView.secondLevelButton
        thirdLevel = levelsView.thirdLevelButton
        fourthLevel = levelsView.fourthLevelButton
        fifthLevel = levelsView.fifthLevelButton
        sixthLevel = levelsView.sixthLevelButton
        
        firstLevel.addTarget(self, action: #selector(level1), for: .touchUpInside)
        secondLevel.addTarget(self, action: #selector(level2), for: .touchUpInside)
        thirdLevel.addTarget(self, action: #selector(level3), for: .touchUpInside)
        fourthLevel.addTarget(self, action: #selector(level4), for: .touchUpInside)
        fifthLevel.addTarget(self, action: #selector(level5), for: .touchUpInside)
        sixthLevel.addTarget(self, action: #selector(level6), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func level1() {
        let vc = GameViewController()
        vc.index = 0
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func level2() {
        if AppDelegate.shared.isLvl2 {
            let vc = GameViewController()
            vc.index = 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func level3() {
        if AppDelegate.shared.isLvl3 {
            let vc = GameViewController()
            vc.index = 2
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func level4() {
        if AppDelegate.shared.isLvl4 {
            let vc = GameViewController()
            vc.index = 3
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func level5() {
        if AppDelegate.shared.isLvl5 {
            let vc = GameViewController()
            vc.index = 4
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func level6() {
        if AppDelegate.shared.isLvl6 {
            let vc = GameViewController()
            vc.index = 5
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}
