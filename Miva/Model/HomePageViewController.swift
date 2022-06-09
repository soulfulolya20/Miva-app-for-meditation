//
//  HomePageViewController.swift
//  Miva
//
//  Created by Admin on 5/2/22.
//

import UIKit
import Firebase
class HomePageViewController: UIViewController {

    
    var helloLabel: UILabel = {
        let label = UILabel()
        
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("nyfb0bDTw0Zld4Npxm7a")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("login")
                label.text = "С возвращением, \(property as! String)"
            } else {
                print("Document does not exist")
            }
        }
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = true
        col.backgroundColor = UIColor(red: 0.90, green: 0.84, blue: 0.81, alpha: 1.00)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.name)
        col.showsHorizontalScrollIndicator = false
        
        return col
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home")
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUp()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    
    func setUp() {
        self.navigationItem.hidesBackButton = true
            
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension HomePageViewController:  UICollectionViewDataSource & UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.name , for: indexPath) as! HomeCollectionViewCell
        
        switch indexPath.row {
        case 0 :
            cell.configurate(name: "7 дней контроля над стрессом", description: " Уходим от напряжения ", imageName: "16")
            return cell
        case 1 :
            cell.configurate(name: "Работа над собой", description: " Учимся ценить жизнь ", imageName: "3")
            return cell
        case 2 :
            cell.configurate(name: "Осознанное питание", description: " Меняем отношение к еде ", imageName: "8")
            return cell
        case 3 :
            cell.configurate(name: "Здоровый сон", description: " Обретаем крепкий сон ", imageName: "1")
            return cell
        case 4 :
            cell.configurate(name: "После карантина", description: " Адаптируемся к миру ", imageName: "11")
            return cell
        case 5 :
            cell.configurate(name: "Обрести счастье", description: " Слушаем сердце ", imageName: "2")
            return cell
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var name: String = ""
        switch indexPath.row {
        case 0 :
            name = "7 дней контроля над стрессом"
        case 1 :
            name = "Работа над собой"
        case 2 :
            name = "Осознанное питание"
        case 3 :
            name = "Здоровый сон"
        case 4 :
            name = "После карантина"
        case 5 :
            name = "Обрести счастье"
        default:
            break
        }
        let detailsVC = HomeDetailsViewController(name: name)
        navigationItem.backBarButtonItem?.image = UIImage(named: "back")
        navigationItem.title = ""
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height / 7)
    }
}
