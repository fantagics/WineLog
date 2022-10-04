//
//  WineListCell.swift
//  WineLog
//
//  Created by 서은지 on 2022/10/04.
//

import UIKit

class WineListCell: UICollectionViewCell {
    
    static let identifier = "CustomListCVCell"
        
    var label = UILabel()

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
                
        contentView.addSubview((label))

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }
}



