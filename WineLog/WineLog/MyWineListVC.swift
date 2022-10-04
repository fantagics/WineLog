//
//  ViewController.swift
//  WineLog
//
//  Created by 이태형 on 2022/10/03.
//

import UIKit

class MyWineListVC: UIViewController {
    
    var sortsData = ["와인종류순","가격순","평점순","test4"]
    var sortsColor: [UIColor] = [.systemYellow, .systemOrange,.systemCyan, .systemMint]
    let flowLayout1 = UICollectionViewFlowLayout()
    let flowLayout2 = UICollectionViewFlowLayout()
    
    lazy var SortCV = UICollectionView(frame: .zero, collectionViewLayout: flowLayout1)
    lazy var ListCV = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        layoutUI()
    }
}
//MARK: UICollectionViewDataSource
extension MyWineListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //갯수전달
        if collectionView == ListCV {
            return 10
        }
        return sortsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //내용전달
       guard let cell = SortCV.dequeueReusableCell(withReuseIdentifier: SortCustomCell.identifier, for: indexPath) as? SortCustomCell
        else { fatalError() }
        
        if collectionView == ListCV {
          guard let cell2 = ListCV.dequeueReusableCell(withReuseIdentifier: WineListCell.identifier, for: indexPath) as? WineListCell
            else { fatalError() }
            cell2.backgroundColor = .secondaryLabel
            return cell2
        }

        cell.backgroundColor = sortsColor[indexPath.item]
        cell.label.text = self.sortsData[indexPath.row]
        return cell
        
    }
    
}
//MARK: UICollectionViewDelegate
extension MyWineListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let wineType = UIAlertController(title: "와인종류별", message: nil, preferredStyle: .actionSheet)
            let wineType1 = UIAlertAction(title: "레드와인", style: .default, handler: nil)
            let wineType2 = UIAlertAction(title: "화이트와인", style: .default, handler: nil)
            let wineType3 = UIAlertAction(title: "로제와인", style: .default, handler: nil)
            
            let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            wineType.addAction(wineTypeCancelAction)
            wineType.addAction(wineType1)
            wineType.addAction(wineType2)
            wineType.addAction(wineType3)
            
            self.present(wineType, animated: true, completion: nil)
        } else {
            if indexPath.row == 1 {
                let wineType = UIAlertController(title: "가격순", message: nil, preferredStyle: .actionSheet)
                let wineType1 = UIAlertAction(title: "가격 오름차순", style: .default, handler: nil)
                let wineType2 = UIAlertAction(title: "가격 내림차순", style: .default, handler: nil)
                
                let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                wineType.addAction(wineTypeCancelAction)
                wineType.addAction(wineType1)
                wineType.addAction(wineType2)
                
                self.present(wineType, animated: true, completion: nil)
            } else {
                if indexPath.row == 2 {
                    let wineType = UIAlertController(title: "평점순", message: nil, preferredStyle: .actionSheet)
                    let wineType1 = UIAlertAction(title: "평점 오름차순", style: .default, handler: nil)
                    let wineType2 = UIAlertAction(title: "평점 내림차순", style: .default, handler: nil)
                    
                    let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    wineType.addAction(wineTypeCancelAction)
                    wineType.addAction(wineType1)
                    wineType.addAction(wineType2)
                    
                    self.present(wineType, animated: true, completion: nil)
                }
            }
        }
    }
}
//MARK: MyWineListVC SetUI()
extension MyWineListVC {
    func setUI(){
                
        flowLayout1.itemSize = CGSize(width: view.frame.width / 4, height: view.frame.height / 15)
        flowLayout1.minimumInteritemSpacing = 5  //아이템간의 가로거리
        flowLayout1.minimumLineSpacing = 5 //아이템간의 세로거리
        flowLayout1.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) //테두리 거리
        flowLayout1.scrollDirection = .horizontal
        
        
        flowLayout2.itemSize = CGSize(width: view.frame.width / 3, height: view.frame.height / 5)
        flowLayout2.minimumInteritemSpacing = 5
        flowLayout2.minimumLineSpacing = 10
        flowLayout2.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout2.scrollDirection = .horizontal
        
        SortCV.dataSource = self
        SortCV.delegate = self
        ListCV.dataSource = self
        SortCV.delegate = self
        
        SortCV.register(SortCustomCell.self, forCellWithReuseIdentifier: SortCustomCell.identifier)
        ListCV.register(WineListCell.self, forCellWithReuseIdentifier: WineListCell.identifier)
        
    }
    //MARK: MyWineListVC layout()
    func layoutUI(){
        
        view.addSubview(SortCV)
        view.addSubview(ListCV)
        SortCV.translatesAutoresizingMaskIntoConstraints = false
        ListCV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            SortCV.topAnchor.constraint(equalTo: view.topAnchor,constant: 130),
            SortCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SortCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SortCV.bottomAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            
            ListCV.topAnchor.constraint(equalTo: SortCV.bottomAnchor),
            ListCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ListCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ListCV.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -250)
        ])
    }
}

