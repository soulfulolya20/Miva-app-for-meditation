//
//  MusicViewController.swift
//  Miva
//
//  Created by Admin on 5/5/22.
//

import UIKit

class MusicViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = true
        col.backgroundColor = UIColor(red: 0.90, green: 0.84, blue: 0.81, alpha: 1.00)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.name)
        col.showsHorizontalScrollIndicator = false
        
        return col
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Музыка"
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpUI() {
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }
    


}

extension MusicViewController: UICollectionViewDataSource & UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.name , for: indexPath) as! MusicCollectionViewCell
        switch indexPath.row {
        case 0 :
            cell.configurate(name: "Настроение космоса", description: "6 композиций", imageName: "10")
            return cell
        case 1 :
            cell.configurate(name: "Праздничный вечер", description: "10 композиций", imageName: "6")
            return cell
        case 2 :
            cell.configurate(name: "Белый шум", description: "5 композиций", imageName: "5")
            return cell
        case 3 :
            cell.configurate(name: "Бездонность", description: "13 композиций", imageName: "17")
            return cell
        case 4 :
            cell.configurate(name: "Прогулки по лесу", description: "4 композиций", imageName: "12")
            return cell
        case 5 :
            cell.configurate(name: "Lo-Fi звучания", description: "3 композиций", imageName: "13")
            return cell
        case 6 :
            cell.configurate(name: "ACMP", description: "5 композиций", imageName: "4")
            return cell
        case 7 :
            cell.configurate(name: "Восстановление", description: "10 композиций", imageName: "14")
            return cell
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var name: String = ""
        var imageName = ""
        switch indexPath.row {
        case 0 :
            name = "Настроение космоса"
            imageName = "10"
        case 1 :
            name = "Праздничный вечер"
            imageName = "6"
        case 2 :
            name = "Белый шум"
            imageName = "5"
        case 3 :
            name = "Бездонность"
            imageName = "17"
        case 4 :
            name = "Прогулки по лесу"
            imageName =  "12"
        case 5 :
            name = "Lo-Fi звучания"
            imageName = "13"
        case 6 :
            name = "ACMP"
            imageName = "4"
        case 7 :
            name = "Восстановление"
            imageName = "14"
        default:
            break
        }
        let detailsVC = MusicDetailsViewController(title: name, imageName: imageName)
        navigationItem.backBarButtonItem?.image = UIImage(named: "back")
        navigationItem.title = ""
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    
}

extension MusicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height / 10)
    }
}
