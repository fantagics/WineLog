//
//  ViewController.swift
//  WineLog
//
//  Created by 이태형 on 2022/10/03.
//

import UIKit

class MyWineListVC: UIViewController {
    
    var sortsData = ["와인종류순","가격순","평점순","초기화"]
    
    let flowLayout1 = UICollectionViewFlowLayout()
    lazy var sortCV = UICollectionView(frame: .zero, collectionViewLayout: flowLayout1)
    lazy var listCV = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    var filteredWineList = [WineInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
        setUI()
        layoutUI()
        loadFromJson()
        filteredWineList = wineListFilter(Singleton.shared.myWines)

  
    }
}

//MARK: UICollectionViewDataSource
extension MyWineListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //갯수전달
        if collectionView == listCV {
            return Singleton.shared.myWines.count
        }
        return sortsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //내용전달
        if collectionView == listCV {
          guard let cell = listCV.dequeueReusableCell(withReuseIdentifier: WineListCell.identifier, for: indexPath) as? WineListCell
            else { fatalError() }
            
            if let priceValue: Int = Singleton.shared.myWines[indexPath.item].price {
                cell.priceLabel.text = "가격:" + String(priceValue.toDecimalFormat()) + "원"
                
            } else {
                cell.priceLabel.text = ""
            }
            
            cell.nameLabel.text = Singleton.shared.myWines[indexPath.item].name
            cell.scoreLabel.text = "총평: \(String(Singleton.shared.myWines[indexPath.item].totalStar))"
            cell.imageView.image = UIImage(data: Singleton.shared.myWines[indexPath.item].profileData)
            switch Singleton.shared.myWines[indexPath.item].type {
            case .white:
                cell.typeImageView.image = UIImage(named: "whiteIcon")
            case .rose:
                cell.typeImageView.image = UIImage(named: "roseIcon")
            case .red:
                cell.typeImageView.image = UIImage(named: "redIcon")
            
            }
            return cell
        }else{
            guard let cell = sortCV.dequeueReusableCell(withReuseIdentifier: SortCustomCell.identifier, for: indexPath) as? SortCustomCell else { fatalError() }
            
         //   cell.backgroundColor = #colorLiteral(red: 0.9589957595, green: 0.8265138268, blue: 0.5008742213, alpha: 1)
            cell.label.textColor = #colorLiteral(red: 0.1236173734, green: 0.3619198501, blue: 0.2140165269, alpha: 1)
            cell.layer.borderColor =  #colorLiteral(red: 0.9589957595, green: 0.8265138268, blue: 0.5008742213, alpha: 1)
            cell.contentView.layer.borderWidth = 2
            cell.label.text = self.sortsData[indexPath.item]
            return cell
        }
    }
}

//MARK: UICollectionViewDelegate
extension MyWineListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == sortCV {
            switch indexPath.item {
            case 0:
                alart1()
            case 1:
                alart2()
            case 2:
                alart3()
            case 4:
                alart4()
            default:
                fatalError()
            }
        }
        else {
            
        }
    }
}

extension MyWineListVC {
    func loadFromJson(){
        let jsonDecoder = JSONDecoder()
        do{
            let data = try Data(contentsOf: Singleton.shared.getFilePath(), options: .mappedIfSafe)
            let received = try jsonDecoder.decode([WineInformation].self, from: data)
            Singleton.shared.myWines = received
        }catch{
            print(error.localizedDescription)
        }
    }
}

//MARK: MyWineListVC SetUI()
    extension MyWineListVC {
        func setUI(){
            
            flowLayout1.itemSize = CGSize(width: view.frame.width / 4, height: view.frame.height / 19)
            flowLayout1.minimumInteritemSpacing = 5  //아이템간의 가로거리
            flowLayout1.minimumLineSpacing = 5 //아이템간의 세로거리
            flowLayout1.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5) //테두리 거리
            flowLayout1.scrollDirection = .horizontal
            
            sortCV.dataSource = self
            sortCV.delegate = self
            listCV.dataSource = self
            sortCV.delegate = self
            
            sortCV.register(SortCustomCell.self, forCellWithReuseIdentifier: SortCustomCell.identifier)
            listCV.register(WineListCell.self, forCellWithReuseIdentifier: WineListCell.identifier)
            
        }
        //MARK: MyWineListVC layout()
        func layoutUI(){
            [sortCV, listCV ].forEach{
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
         
            NSLayoutConstraint.activate([
                sortCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 15),
                sortCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sortCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sortCV.bottomAnchor.constraint(equalTo: view.topAnchor,constant: 170),
                
                listCV.topAnchor.constraint(equalTo: sortCV.bottomAnchor,constant: 10),
                listCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                listCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                listCV.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150),
                
                
            ])
        }
        func wineListFilter(_ wineList: [WineInformation]) ->[WineInformation] {
            var result = [WineInformation]()
            for idx in 0 ..< Singleton.shared.myWines.count {
                var typeBool = false
                let typeOption = Singleton.shared.wineType
                if typeOption == 0 {
                    typeBool = true
                } else {
                    if Singleton.shared.myWines[idx].type == Singleton.shared.wineTypeValue[typeOption - 1] {
                        typeBool = true
                    } else {
                        typeBool = false
                    }
                }
            }
            return result
        }
    }

extension MyWineListVC {
    func alart1() {
        let wineType = UIAlertController(title: "와인종류별", message: nil, preferredStyle: .actionSheet)
        let wineType1 = UIAlertAction(title: "레드와인", style: .default) { (UIAlertAction) in
            Singleton.shared.wineType = 2
            
        }
        let wineType2 = UIAlertAction(title: "화이트와인", style: .default) { (UIAlertAction) in
            Singleton.shared.wineType = 1 }
        let wineType3 = UIAlertAction(title: "로제와인", style: .default) { (UIAlertAction) in
            Singleton.shared.wineType = 3 }
        let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        wineType.addAction(wineTypeCancelAction)
        wineType.addAction(wineType1)
        wineType.addAction(wineType2)
        wineType.addAction(wineType3)
        self.present(wineType, animated: true, completion: nil)
    }
    func alart2() {
        var sortedWines = Singleton.shared.myWines.sorted(by: { $0.price ?? .max < $1.price ?? .max })
        
        let wineType = UIAlertController(title: "가격순", message: nil, preferredStyle: .actionSheet)
        let wineType1 = UIAlertAction(title: "가격 오름차순", style: .default) { (UIAlertAction) in
            let wines = Singleton.shared.myWines
            sortedWines = wines
            self.listCV.reloadData()
            
        }
        let wineType2 = UIAlertAction(title: "가격 내림차순", style: .default, handler: nil)
        let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        wineType.addAction(wineTypeCancelAction)
        wineType.addAction(wineType1)
        wineType.addAction(wineType2)
        
        self.present(wineType, animated: true, completion: nil)
    }
func alart3() {
    let wineType = UIAlertController(title: "평점순", message: nil, preferredStyle: .actionSheet)
    let wineType1 = UIAlertAction(title: "평점 오름차순", style: .default, handler: nil)
    let wineType2 = UIAlertAction(title: "평점 내림차순", style: .default, handler: nil)
    
    let wineTypeCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    wineType.addAction(wineTypeCancelAction)
    wineType.addAction(wineType1)
    wineType.addAction(wineType2)
    
    self.present(wineType, animated: true, completion: nil)
}
    func alart4() {
        
    }
}

extension MyWineListVC {
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 7, trailing: 7)
            
            //Group (row)  //세로길이: 33% , 그룹당 아이템 개수: 3
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: NSCollectionLayoutDimension.fractionalWidth(2/3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
}
