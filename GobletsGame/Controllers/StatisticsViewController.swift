//
//  StatisticsViewController.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var statisticsArray = Statistics.shared.resultsArray
    let statisticsView = StatisticsView()
    var backButton = UIButton()
    //var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isItFirst()
        configure()
        setupDelegate()
        print(statisticsArray)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        statisticsView.collectionView.reloadData()
    }
    
}

extension StatisticsViewController {
    func isItFirst() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let isItFirst = appDelegate?.isFirst
        if isItFirst == true {
            let vc = EnterNameViewController()
            vc.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
            appDelegate?.isFirst = false
            statisticsView.collectionView.reloadData()
        }
        
    }
}

extension StatisticsViewController {
    private func setupDelegate() {
            statisticsView.collectionView.delegate = self
            statisticsView.collectionView.dataSource = self
    }
    
    private func configure() {
        view.addSubview(statisticsView)
        
        
        statisticsView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        backButton = statisticsView.backButton
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
        
    }

}

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statisticsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatisticCollectioViewCell.reuseId, for: indexPath) as? StatisticCollectioViewCell  else {
            fatalError("UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ")
        }
        if statisticsArray[indexPath.row].name != AppDelegate.shared.userName {
            cell.nameLabel.text = statisticsArray[indexPath.row].name
            cell.resultTimeLabel.text = statisticsArray[indexPath.row].time
        } else {
            cell.nameLabel.text = AppDelegate.shared.userName
            cell.resultTimeLabel.text = AppDelegate.shared.userTime
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: statisticsView.collectionView.frame.width, height: 50)
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    
}

extension StatisticsViewController: EnterViewControllerDelegate {
    func didSaveName() {
        statisticsView.collectionView.reloadData()
        statisticsArray = Statistics.shared.resultsArray
    }
}





