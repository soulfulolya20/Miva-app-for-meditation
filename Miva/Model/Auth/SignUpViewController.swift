//
//  SignUpViewController.swift
//  Miva
//
//  Created by Admin on 5/2/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
//    private let logo: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "logo")
//        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
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
        label.text = "Регистрация"
        label.font = .systemFont(ofSize: 33, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Зарегистрируйтесь, чтобы иметь доступ"
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
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Не все поля заполнены"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .red
        label.isHidden = true
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
    
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "Имя пользователя"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var TextField1: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = false
        textField.keyboardType = UIKeyboardType.default
        textField.textAlignment = .center
        textField.placeholder = "Введите имя пользователя"
        textField.layer.cornerRadius = 25
        textField.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        textField.backgroundColor = UIColor(red: 0.043, green: 0.533, blue: 0.565, alpha: 0.13)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        button.setTitle("Регистрация", for: .normal)
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
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменить фотографию", for: .normal)
        button.setTitleColor(UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.addAction(UIAction() { [weak self] _ in
            self?.addPhoto()
        }, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.894, green: 0.627, blue: 0.592, alpha: 0)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.borderWidth = 0.5
        imageView.layer.backgroundColor = UIColor(red: 0.045, green: 0.532, blue: 0.567, alpha: 0.33).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 80
        imageView.clipsToBounds = true
        return imageView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        setUp()
        setCustomBackButton()
        addGestures()
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func addGestures() {
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(navigateToAuth))
        edgeGesture.edges = .left
        view.addGestureRecognizer(edgeGesture)
    }
    
    func checkValid() -> String? {
        if loginTextField.text == "" ||
           passwordTextField.text == "" ||
           TextField1.text == "" ||
           TextField1.text == nil ||
           loginTextField.text == nil ||
           passwordTextField.text == nil
        {
            print("All good")
            return "pls fill in all fields"
        }
        return nil
    }
    
    func upload(currentUserId: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
            // cоздали ссылку на папку с аватарками
           let ref = Storage.storage().reference().child("avatars").child(currentUserId)
            // конвертируем объект типа Image в объект типа Data
           guard let imageData = imageView.image?.jpegData(compressionQuality: 0.4) else { return }

           let metadata = StorageMetadata()
           metadata.contentType = "image/jpeg" // создали метадату

           ref.putData(imageData, metadata: metadata) { (metadata, error) in
               guard let _ = metadata else { // проверка на ошибки
                   completion(.failure(error!))
                   return
               }
               ref.downloadURL { (url, error) in // получаем ссылку на загруженное изображение
                   guard let url = url else {
                       completion(.failure(error!))
                       return
                   }
                   completion(.success(url))
               }
           }
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
    
    func navigateToHome() {
        
        let error = checkValid()
        
        if error != nil {
            errorLabel.isHidden = false
        } else {
            Auth.auth().createUser(withEmail: loginTextField.text!, password: passwordTextField.text!) { result, error in
                if error != nil {
                    self.errorLabel.text = "\(error?.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "login": self.TextField1.text!,
                        "uid": result!.user.uid,
                        "avatar": ""
                        
                    ]) { error in
                        if error != nil {
                            self.errorLabel.text = "Error saving user in database"
                        }
                    }
                    
                    print("wow!!!!")

                    
//                    let vc = HomePageViewController()
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc func navigateToAuth() {
        navigationController?.popViewController(animated: true)
    }
    
    func setUp() {
        self.tabBarController?.tabBar.isHidden = true
        //view.addSubview(logo)
       // view.addSubview(backButton)
        view.addSubview(signInLabel)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(label3)
        view.addSubview(TextField1)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        view.addSubview(avatarButton)
        view.addSubview(imageView)
        makeConstraints()
    }
    
    func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.image = image
        
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 163),
            imageView.heightAnchor.constraint(equalToConstant: 163),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            avatarButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            avatarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label1.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 2),
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0.7),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 40),
            label3.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            
            TextField1.widthAnchor.constraint(equalToConstant: 300),
            TextField1.heightAnchor.constraint(equalToConstant: 53),
            TextField1.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 6),
            TextField1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: TextField1.bottomAnchor, constant: 10),
            loginLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            
            loginTextField.widthAnchor.constraint(equalToConstant: 300),
            loginTextField.heightAnchor.constraint(equalToConstant: 53),
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 6),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
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
