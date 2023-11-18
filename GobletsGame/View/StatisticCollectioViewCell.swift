//
//  StatisticCollectioViewCell.swift
//  GobletsGame
//
//  Created by Александр Андреев on 21.07.2023.
//

import UIKit

class StatisticCollectioViewCell: UICollectionViewCell {
    static let reuseId = "StatisticCollectioViewCell"
    
    let imageView = UIImageView(image: UIImage(named: Resources.Images.resultRectangle))
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Resources.Fonts.standartFont, size: 24)
        return label
    }()
    
    public var resultTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Resources.Fonts.standartFont, size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(resultTimeLabel)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        
        //imageView.layer.cornerRadius = 25
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(9)
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
        }
        resultTimeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(6)
            make.width.equalTo(55)
            make.height.equalTo(29)
        }
        
    }
}
