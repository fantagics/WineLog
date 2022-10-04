//
//  DetailWineViewController.swift
//  WineLog
//
//  Created by 순진이 on 2022/10/04.
//

import UIKit

final class DetailWineViewController: UIViewController {
//    let detailWineView = DetailWineView()
    let detailWineView = DetailWineInfoView()

    override func loadView() {
        super.loadView()
        view = detailWineView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}
//MARK: -UI
extension DetailWineViewController {
    private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    private func setAttributes() {
        
    }
    
    private func addTarget() {
        
    }
    
    private func setConstraints() {
        
    }
}

