//
//  HomeCollectionViewCell.swift
//  Miva
//
//  Created by Георгий Бутров on 09.06.2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static var name: String {
        return "HomeCollectionCell"
    }
    
    let poster: UIImageView = {
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let title: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 0.04, green: 0.53, blue: 0.56, alpha: 0.3)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 5
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    public func configurate(name: String, description: String, imageName: String) {
        title.text = name
        descriptionLabel.text = description
        poster.image = UIImage(named: imageName)
    }
    
    func layout() {
        contentView.backgroundColor = UIColor(red: 0.95, green: 0.94, blue: 0.87, alpha: 1.00)
        contentView.addSubview(poster)
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
        contentView.layer.cornerRadius = 10
        
        
        NSLayoutConstraint.activate([
//            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
//            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
//            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            poster.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            poster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            poster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            poster.widthAnchor.constraint(equalToConstant: 100),
            poster.heightAnchor.constraint(equalToConstant: 75),
        
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15)
        ])
    }
}
