//
//  ViewController.swift
//  WineLog
//
//  Created by 이태형 on 2022/10/03.
//

import UIKit

<<<<<<< HEAD
final class AddWineCategoryVC: UIViewController {
    
    let redWineButton = UIButton()
    let whiteWineButton = UIButton()
    let roseWindeButton = UIButton()
    let buttonStackView = UIStackView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
=======
class AddWineCategoryVC: UIViewController {
    let button = UIButton()
//    let loadBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a
    }
    
}

extension AddWineCategoryVC{
    @objc func didTapButton(_ sender: UIButton){
        let nextVC = AddWineInformationVC()
        nextVC.wineType = .white
        nextVC.isAddWine = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
//    @objc func didTapLoadBtn(_ sender: UIButton){
//        loadFromJson()
//    }
}
<<<<<<< HEAD
//MARK: - Button Action
extension AddWineCategoryVC {
    @objc func wineButtonTapped(_ sender: UIButton) {
        print(sender.currentTitle)
        let detailWineVC = DetailWineViewController()
        self.navigationController?.pushViewController(detailWineVC, animated: true)
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
//        redWineButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 30)
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
        
//        view.addSubview(redWineButton)
        
        NSLayoutConstraint.activate([
//            buttonStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            buttonStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            redWineButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            redWineButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            redWineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            redWineButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            redWineButton.widthAnchor.constraint(equalToConstant: 30)
=======

extension AddWineCategoryVC{
    private func setUI(){
        button.setTitle("GO", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        loadBtn.setTitle("LOAD", for: .normal)
//        loadBtn.setTitleColor(.blue, for: .normal)
//        loadBtn.addTarget(self, action: #selector(didTapLoadBtn), for: .touchUpInside)
        
        
        view.addSubview(button)
//        view.addSubview(loadBtn)
        button.translatesAutoresizingMaskIntoConstraints = false
//        loadBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
//            loadBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            loadBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            loadBtn.heightAnchor.constraint(equalToConstant: 30)
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a
        ])
    }
}

<<<<<<< HEAD
=======

//extension AddWineCategoryVC{
//    func loadFromJson(){
//        let jsonDecoder = JSONDecoder()
//        do{
//            let data = try Data(contentsOf: Singleton.shared.getFilePath(), options: .mappedIfSafe)
//            let received = try jsonDecoder.decode([WineInformation].self, from: data)
//            let loadData: [WineInformation] = received
//            print(loadData)
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//}
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a
