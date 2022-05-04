//
//  SignInViewController.swift
//  Miva
//
//  Created by Admin on 5/2/22.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.imageView?.tintColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        button.addAction(UIAction() { [weak self] _ in
            self?.navigateToAuth()
        }, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход в аккаунт"
        label.font = .systemFont(ofSize: 33, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Авторизируйтесь, чтобы иметь доступ"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "к Вашим занятиям и прослушиванию музыки"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = false
        textField.keyboardType = UIKeyboardType.default
        textField.textAlignment = .center
        textField.placeholder = "Введите e-mail адрес"
        textField.layer.cornerRadius = 25
        textField.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        textField.backgroundColor = UIColor(red: 0.043, green: 0.533, blue: 0.565, alpha: 0.13)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.keyboardType = UIKeyboardType.default
        textField.textAlignment = .center
        textField.placeholder = "Введите пароль"
        textField.layer.cornerRadius = 25
        textField.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        textField.backgroundColor = UIColor(red: 0.043, green: 0.533, blue: 0.565, alpha: 0.13)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.addAction(UIAction() { [weak self] _ in
            self?.navigateToHome()
        }, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0.9)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Неверный e-mail или пароль"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        setUp()
        
        setCustomBackButton()
        addGestures()
        
    }
    

}

extension SignInViewController {
    
    func addGestures() {
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(navigateToAuth))
        edgeGesture.edges = .left
        view.addGestureRecognizer(edgeGesture)
    }
    
    
    
    func setCustomBackButton() {
        let image = UIImage(named: "back2")
        let backButton = UIButton()
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 0.6)
        backButton.imageView?.contentMode = .left
        backButton.addAction(UIAction { [weak self] _ in
            self?.navigateToAuth()
        }, for: .touchUpInside)
        let spacer = UIBarButtonItem(systemItem: .fixedSpace)
        spacer.width = 10
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: false)
    }
    
    func errorAction() {
        
    }
    
    func navigateToHome() {
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!) { [self] result, error in
            if error != nil {
                //error
                errorLabel.isHidden = false
            } else {
                print("wow!!!!")
            }
        }
        
    }
    
    @objc func navigateToAuth() {
        navigationController?.popViewController(animated: true)
        
    }
    
    func setUp() {
        view.addSubview(logo)
      //  view.addSubview(backButton)
        view.addSubview(signInLabel)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        

        makeConstraints()
    }
    
    
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 76),
            logo.heightAnchor.constraint(equalToConstant: 76),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            backButton.widthAnchor.constraint(equalToConstant: 39),
//            backButton.heightAnchor.constraint(equalToConstant: 40),
//            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            signInLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label1.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 2),
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0.7),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 40),
            loginLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            
            loginTextField.widthAnchor.constraint(equalToConstant: 300),
            loginTextField.heightAnchor.constraint(equalToConstant: 53),
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 6),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 53),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.widthAnchor.constraint(equalToConstant: 269),
            signInButton.heightAnchor.constraint(equalToConstant: 42),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
}
