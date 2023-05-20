//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 19/05/23.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    static let identifier = "CharacterTableViewCell"
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .cyan
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterImageView)
        
        applyContraints()
    }
    
    private func applyContraints() {
        let characterNameLabelConstraint = [
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 30),
            characterNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let characterImageViewConstraint = [
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
            
        NSLayoutConstraint.activate(characterNameLabelConstraint)
        NSLayoutConstraint.activate(characterImageViewConstraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImageView.frame = bounds
    }
    
    public func configure(with model: CharacterMainViewModel) {
        guard let url = URL(string: model.imageURL) else {return}
        characterImageView.sd_setImage(with: url)
        characterNameLabel.text = model.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
