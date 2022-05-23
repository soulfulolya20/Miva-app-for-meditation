//
//  MusicViewController.swift
//  Miva
//
//  Created by Admin on 5/5/22.
//

import UIKit

class MusicViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.name)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Музыка"
        tableView.dataSource = self
        tableView.delegate = self
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpUI() {
        self.navigationItem.hidesBackButton = true
        tableView.separatorColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        self.tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        
        
        
    }
    


}
extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.name, for: indexPath) as? MusicTableViewCell else { return UITableViewCell() }
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
            cell.configurate(name: "Прошулки по лесу", description: "4 композиций", imageName: "12")
            return cell
        case 5 :
            cell.configurate(name: "Lo-Fi звечания", description: "3 композиций", imageName: "13")
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            name = "Прошулки по лесу"
            imageName =  "12"
        case 5 :
            name = "Lo-Fi звечания"
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
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
