//
//  WineListCell.swift
//  WineLog
//
//  Created by 서은지 on 2022/10/04.
//

import UIKit

class WineListCell: UICollectionViewCell {
    
    static let identifier = "CustomListCVCell"
        
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var scoreLabel = UILabel()
    var typeImageView = UIImageView()

    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WineListCell {
    func setUI() {
        imageView.image = UIImage(named: "이미지테스트")

        [nameLabel, priceLabel,scoreLabel,imageView,typeImageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        priceLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.adjustsFontSizeToFitWidth = true
      
        nameLabel.backgroundColor = .systemYellow
        priceLabel.backgroundColor = .systemOrange
        scoreLabel.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28),
            
            scoreLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            scoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            typeImageView.topAnchor.constraint(equalTo: imageView.topAnchor),
            typeImageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            typeImageView.heightAnchor.constraint(equalToConstant: 30),
            typeImageView.widthAnchor.constraint(equalTo: typeImageView.heightAnchor)

        ])
    }
}



