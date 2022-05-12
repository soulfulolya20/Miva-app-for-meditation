//
//  EditProfileViewController.swift
//  Miva
//
//  Created by Admin on 5/4/22.
//

import UIKit
import Firebase
import FirebaseCore

class EditProfileViewController: UIViewController {
    

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
        setCustomBackButton()
        addGestures()
        setUp()
        
        // Do any additional setup after loading the view.
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func setUp() {
        view.addSubview(avatarButton)
        view.addSubview(imageView)
        makeConstraints()
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
    
    func update() {
        
    }

    func setCustomBackButton() {
        let image = UIImage(named: "back2")
        let backButton = UIButton()
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 0.6)
        backButton.imageView?.contentMode = .left
        backButton.addAction(UIAction { [weak self] _ in
            self?.navigateToProfile()
        }, for: .touchUpInside)
        let spacer = UIBarButtonItem(systemItem: .fixedSpace)
        spacer.width = 10
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: false)
    }
    
    func addGestures() {
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(navigateToProfile))
        edgeGesture.edges = .left
        view.addGestureRecognizer(edgeGesture)
    }
    
    @objc func navigateToProfile() {
        navigationController?.popViewController(animated: true)
    }
    
    func addPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        update()
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
            
            ])
    }
}
