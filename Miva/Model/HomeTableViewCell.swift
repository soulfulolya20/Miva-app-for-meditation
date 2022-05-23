//
//  MainTableViewCell.swift
//  Miva
//
//  Created by Георгий Бутров on 23.05.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static var name: String {
        return "HomeTableViewCell"
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
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
//        self.backgroundView = view
//        backgroundView?.frame = backgroundView?.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)) ??  CGRect.zero
         contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 6, bottom: 4, right: 6))
        
        //contentView.layer.backgroundColor = CGColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
//        contentView.layer.borderColor = CGColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
//        contentView.layer.borderWidth = 4
         contentView.layer.cornerRadius = 5
        
        
        layout()
    }
    
    public func configurate(name: String, description: String, imageName: String) {
        title.text = name
        descriptionLabel.text = description
        poster.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        descriptionLabel.text = nil
        poster.image = nil
    }
    
    private func layout() {
        
        contentView.backgroundColor = UIColor(red: 0.96, green: 0.81, blue: 0.81, alpha: 1.00)
        contentView.addSubview(poster)
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
        
        
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
