//
//  ProfileViewController.swift
//  Miva
//
//  Created by Admin on 5/4/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 80
        imageView.layer.backgroundColor = UIColor(red: 0.045, green: 0.532, blue: 0.567, alpha: 0.33).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        let uid = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        let docRef = db.collection("users").document("XqHFh6WDrrQHeS8KEGP9")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("login")
                label.text = (property as! String)
            } else {
                print("Document does not exist")
            }
        }
        label.font = .systemFont(ofSize: 33, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        let email = Auth.auth().currentUser?.email
        label.text = email
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выход", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.addAction(UIAction() { [weak self] _ in
            self?.exit()
        }, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0)
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
        view.addSubview(logo)
        view.addSubview(emailLabel)
        view.addSubview(loginLabel)
        view.addSubview(imageView)
        view.addSubview(exitButton)
        makeConstraints()
    }
    
    func exit() {
        do {
        try Auth.auth().signOut()
        } catch {print("ne vishel") }
            
        if Auth.auth().currentUser == nil {
                let authVC = AuthViewController()
            navigationController!.pushViewController(authVC, animated: false)
        } else {
            print("\(Auth.auth().currentUser?.email)")
        }
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 76),
            logo.heightAnchor.constraint(equalToConstant: 76),
            logo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 163),
            imageView.heightAnchor.constraint(equalToConstant: 163),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 9),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 4),
            
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
            ])
    }
}
