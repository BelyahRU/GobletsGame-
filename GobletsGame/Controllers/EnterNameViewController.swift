//
//  EnterNameViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 22.07.2023.
//

import Foundation
import UIKit
protocol EnterViewControllerDelegate: AnyObject {
    func didSaveName()
}


class EnterNameViewController: UIViewController {
    
    var popUpWindowView = EnterNameView()
    weak var delegate: EnterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        popUpWindowView.okButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private func configure() {
        view.backgroundColor = .clear
        popUpWindowView.backgroundColor = .clear
        view.addSubview(popUpWindowView)
        popUpWindowView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalToSuperview()
        }
    }
    
    @objc func buttonPressed() {
        let name = popUpWindowView.nameTF.text!
        let user = Result(name: name, time: AppDelegate.shared.userTime)
        AppDelegate.shared.userName = name
        Statistics.shared.resultsArray.insert(user, at: 0)
        delegate?.didSaveName()
        dismiss(animated: true)
    }
}


