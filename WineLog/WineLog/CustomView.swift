//
//  CustomView.swift
//  WineLog
//
//  Created by 순진이 on 2022/10/06.
//

import UIKit

class CustomLabelView: UIView {
    var titleLabel = UILabel()
    var infoLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributes()
        setUI()
    }
    
    init(title: String, info: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        infoLabel.text = info
        setAttributes()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAttributes() {
        [titleLabel, infoLabel].forEach {
            infoLabel.font = .systemFont(ofSize: 16)
            titleLabel.font = .boldSystemFont(ofSize: 16)
            $0.textAlignment = .left
            $0.textColor = .darkGray
            
        }
    }
    
    func setUI() {
        [titleLabel, infoLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 50),
            
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            infoLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
}

class CustomGradeView: UIView {
    
    let titleLabel = UILabel()
    var starArray = [UIImageView]()
    let starStack = UIStackView()
    //var imageViewArray = [UIImageView(image: UIImage(systemName: "star.fill")), UIImageView(image: UIImage(systemName: "star.fill")),UIImageView(image: UIImage(systemName: "star.fill")),UIImageView(image: UIImage(systemName: "star.fill")),UIImageView(image: UIImage(systemName: "star.fill"))]

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(title:String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setUI()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {

        for _ in 0...4 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "star_empty")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .lightGray
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            starStack.addArrangedSubview(imageView)
        }
        
        for i in 0...4{
            starArray.append(starStack.subviews[i] as? UIImageView ?? UIImageView())
        }
        
        [titleLabel, starStack].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 50),
            
            starStack.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            starStack.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func setAttributes() {
        
        [titleLabel].forEach {
            
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textAlignment = .left
            $0.textColor = .darkGray
            
        }
    }
    //들어오는 Double 값에 따라 별을 색칠해줘야 함
    func setStarStack(_ starValue: Int, _ stackArray: [UIImageView]) {
        for i in 0...4 {
            stackArray[i].image = i < starValue ? UIImage(named: "yellow_star_full") : UIImage(named: "star_empty")
        }
 
    }
    
//    func setStarStackTest(_ starValue: Int) {
//        for i in 0...starValue {
//
//        }
//    }
}
