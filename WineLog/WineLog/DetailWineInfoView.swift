//
//  DetailWineInfoView.swift
//  WineLog
//
//  Created by 순진이 on 2022/10/04.
//

import UIKit

class DetailWineInfoView: UIView {
    
    let firstBackView = UIView()
    
    var wineImage = UIImageView()
    // 와인이름
    let wineNameLabel = UILabel()
    let wineNameTextField = UITextField()
    // 와인종류
    let kindOfWineLabel = UILabel()
    let kindOfWineTextField = UITextField()
    // 산지
    let countryOfOriginLabel = UILabel()
    let countryOfOriginTextField = UITextField()
    // 제조일
    let yearOfMakingLabel = UILabel()
    let yearOfMakingTextField = UITextField()
    // 시음 날짜
    let dateToDrinkLabel = UILabel()
    let dateToDrinkTextField = UITextField()
    // 별점 (당도, 산도, 바디)
    let gradeOfWineLabel = UILabel()
    let gradeOfWineTextField = UITextField()
    // 구매처
    let storeToBuyLabel = UILabel()
    let storeToBuyTextField = UITextField()
    // 가격
    let priceOfWineLabel = UILabel()
    let priceOfWineTextField = UITextField()
    // 한줄평
    let reviewOfWineLabel = UILabel()
    let reviewOfWineTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setAttributes() {
        firstBackView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        firstBackView.layer.cornerRadius = 25
        
        wineImage.image = UIImage(named: "wine_example")
        wineImage.contentMode = .scaleAspectFill
        wineImage.clipsToBounds = true
        
        [wineNameLabel].forEach {
            $0.text = "KIMCROWFORD"
            $0.font = UIFont.boldSystemFont(ofSize: 25)
        }
        
    }
    
    func setUI() {
        [wineImage, wineNameLabel].forEach {
            firstBackView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(firstBackView)
        firstBackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstBackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            firstBackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            firstBackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            firstBackView.bottomAnchor.constraint(equalTo: wineImage.bottomAnchor, constant: 30),
            
            wineImage.leadingAnchor.constraint(equalTo: firstBackView.leadingAnchor, constant: 30),
            wineImage.topAnchor.constraint(equalTo: firstBackView.topAnchor, constant: 30),
            wineImage.widthAnchor.constraint(equalToConstant: 100),
            wineImage.heightAnchor.constraint(equalToConstant: 180),
            
            wineNameLabel.leadingAnchor.constraint(equalTo: wineImage.trailingAnchor, constant: 30),
            wineNameLabel.topAnchor.constraint(equalTo: firstBackView.topAnchor, constant: 30),
            wineNameLabel.trailingAnchor.constraint(equalTo: firstBackView.trailingAnchor, constant: -30),
        ])
    }
}
