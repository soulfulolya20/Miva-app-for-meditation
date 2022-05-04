//
//  AuthViewController.swift
//  Miva
//
//  Created by Admin on 5/2/22.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    
    private let nameApp: UILabel = {
        let label = UILabel()
        label.text = "Miva"
        label.font = .systemFont(ofSize: 33, weight: .semibold)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let welcome: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let slogan: UILabel = {
        let label = UILabel()
        label.text = "Занимайтесь медитацией вместе с нами"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.addAction(UIAction() { [weak self] _ in
            self?.navigateToSignIn()
        }, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0.9)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let isAccount: UILabel = {
        let label = UILabel()
        label.text = "Нет аккаунта?"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.addAction(UIAction() { [weak self] _ in
            self?.navigateToSignUp()
        }, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        setUp()
    }
}

extension AuthViewController {
    
    func navigateToSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToSignIn() {
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUp() {
        view.addSubview(logo)
        view.addSubview(nameApp)
        view.addSubview(welcome)
        view.addSubview(slogan)
        view.addSubview(signInButton)
        view.addSubview(isAccount)
        view.addSubview(signUpButton)
        makeConstraints()
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 76),
            logo.heightAnchor.constraint(equalToConstant: 76),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameApp.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 5),
            nameApp.centerXAnchor.constraint(equalTo: logo.centerXAnchor),
            
            welcome.topAnchor.constraint(equalTo: nameApp.bottomAnchor, constant: 1),
            welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            slogan.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 1),
            slogan.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.widthAnchor.constraint(equalToConstant: 269),
            signInButton.heightAnchor.constraint(equalToConstant: 42),
            signInButton.topAnchor.constraint(equalTo: isAccount.topAnchor, constant: -180),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            isAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66),
            isAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpButton.widthAnchor.constraint(equalToConstant: 156),
            signUpButton.heightAnchor.constraint(equalToConstant: 21),
            signUpButton.topAnchor.constraint(equalTo: isAccount.bottomAnchor, constant: 2),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

