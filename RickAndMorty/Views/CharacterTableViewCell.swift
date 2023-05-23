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
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterSpeciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterSpeciesLabel)
        contentView.addSubview(characterImageView)
        
        applyContraints()
    }
    
    private func applyContraints() {
        let characterNameLabelConstraint = [
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 30),
            characterNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10)
        ]
        
        let characterSpeciesLabelConstraint = [
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterNameLabel.topAnchor, constant: 32),
            characterSpeciesLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 30),
        ]
        
        let characterImageViewConstraint = [
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
            
        NSLayoutConstraint.activate(characterNameLabelConstraint)
        NSLayoutConstraint.activate(characterSpeciesLabelConstraint)
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
        characterSpeciesLabel.text = model.species
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
