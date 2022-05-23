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
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.name)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "С возвращением, \(helloLabel.text ?? "user")"
        print("Home")
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }
    
    
        func setUp() {
        self.navigationItem.hidesBackButton = true
        
        //view.addSubview(helloLabel)
        view.addSubview(tableView)
        tableView.separatorColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        self.tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        
//        NSLayoutConstraint.activate([
//            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            helloLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//
//
//        ])
        
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return cellSpacingHeight
//        }

}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.name, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
}
