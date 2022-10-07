//
//  ViewController.swift
//  WineLog
//
//  Created by 이태형 on 2022/10/03.
//

import UIKit

final class AddWineCategoryVC: UIViewController {
    
    let redWineButton = UIButton()
    let whiteWineButton = UIButton()
    let roseWindeButton = UIButton()
    let buttonStackView = UIStackView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
}

//MARK: - Button Action
extension AddWineCategoryVC {
    @objc func wineButtonTapped(_ sender: UIButton) {
//        print(sender.currentTitle)
//        let detailWineVC = DetailWineViewController()
//        self.navigationController?.pushViewController(detailWineVC, animated: true)
        let nextVC = AddWineInformationVC()
        nextVC.wineType = .white
        nextVC.isAddWine = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

//MARK: -UI
extension AddWineCategoryVC {
    private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    private func setAttributes() {
        redWineButton.setTitle("red", for: .normal)
        redWineButton.setTitleColor(UIColor.red, for: .normal)
        redWineButton.imageView?.contentMode = .scaleAspectFill
        redWineButton.setImage(UIImage(named: "redWine"), for: .normal)
        whiteWineButton.setImage(UIImage(named: "whiteWine"), for: .normal)
        whiteWineButton.setTitle("white", for: .normal)
        whiteWineButton.imageView?.contentMode = .scaleAspectFill
        roseWindeButton.setImage(UIImage(named: "roseWine"), for: .normal)
        roseWindeButton.setTitle("rose", for: .normal)
        roseWindeButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func addTarget() {
        redWineButton.addTarget(self, action: #selector(wineButtonTapped(_:)), for: .touchUpInside)
        whiteWineButton.addTarget(self, action: #selector(wineButtonTapped(_:)), for: .touchUpInside)
        roseWindeButton.addTarget(self, action: #selector(wineButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        buttonStackView.addArrangedSubview(whiteWineButton)
        buttonStackView.addArrangedSubview(roseWindeButton)
        buttonStackView.addArrangedSubview(redWineButton)
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 3
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            redWineButton.widthAnchor.constraint(equalToConstant: 30)

        ])
    }
}


