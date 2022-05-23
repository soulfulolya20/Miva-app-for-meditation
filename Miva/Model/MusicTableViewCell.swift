//
//  MusicTableViewCell.swift
//  Miva
//
//  Created by Георгий Бутров on 23.05.2022.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    static var name: String {
        return "MusicTableViewCell"
    }
    
    let poster: UIImageView = {
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
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
        $0.backgroundColor = UIColor(red: 0.36, green: 0.75, blue: 0.87, alpha: 1.00)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 5
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    public func configurate(name: String, description: String, imageName: String) {
        titleLabel.text = name
        descriptionLabel.text = description
        poster.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        poster.image = nil
    }
    
    private func layout() {
        contentView.addSubview(poster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalToConstant: 45),
            poster.heightAnchor.constraint(equalToConstant: 45),
            poster.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            poster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 5),
            
            
        ])
    }
}
