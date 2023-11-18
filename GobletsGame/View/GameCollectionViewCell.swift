//
//  GameCollectionViewCell.swift
//  GobletsGame
//
//  Created by Александр Андреев on 23.07.2023.
//

import UIKit

class CupCell: UICollectionViewCell {
    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(for color: CupColor) {
        switch color {
        case .gold:
            imageView.image = UIImage(named: "goldCup")
        case .white:
            imageView.image = UIImage(named: "whiteCup")
        case .empty:
            imageView.image = nil
        }
    }
}
