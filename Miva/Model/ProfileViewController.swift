//
//  ProfileViewController.swift
//  Miva
//
//  Created by Admin on 5/4/22.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("nyfb0bDTw0Zld4Npxm7a")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("login")
                label.text = (property as! String)
            } else {
                print("Document does not exist")
            }
        }
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        let email = Auth.auth().currentUser?.email
        label.text = email
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        var imageView = UIImageView()
        
        let image = UIImage(named: "face2")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 80
        imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выход", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .light)
        button.addAction(UIAction() { [weak self] _ in
            self?.exit()
        }, for: .touchUpInside)
       // button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0.9)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }

}

private extension ProfileViewController {
    
    func setUp() {
        view.addSubview(emailLabel)
        view.addSubview(loginLabel)
        view.addSubview(imageView)
        view.addSubview(exitButton)
        makeConstraints()
    }
    
    func exit() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            print("vishel")
            let authVC = AuthViewController()
            navigationController?.pushViewController(authVC, animated: false)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }

    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 163),
            imageView.heightAnchor.constraint(equalToConstant: 163),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: -5),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exitButton.widthAnchor.constraint(equalToConstant: 156),
            exitButton.heightAnchor.constraint(equalToConstant: 21),
            exitButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
