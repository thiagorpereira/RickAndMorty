//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 20/05/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterSpeciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterOriginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemGray
        return label
    }()
    
    private let characterLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemGray
        return label
    }()

    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 32
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(characterImageView)
        view.addSubview(characterNameLabel)
        view.addSubview(characterStatusLabel)
        view.addSubview(characterSpeciesLabel)
        view.addSubview(characterTypeLabel)
        view.addSubview(characterGenderLabel)
        view.addSubview(characterOriginLabel)
        view.addSubview(characterLocationLabel)
        
        applyContraints()

    }
    
    private func applyContraints() {
        
        let characterImageViewConstraint = [
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 300)
        ]
        let characterNameLabelConstraint = [
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50),
            characterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterStatusLabelConstraint = [
            characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 30),
            characterStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterSpeciesLabelConstraint = [
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterGenderLabel.bottomAnchor, constant: 30),
            characterSpeciesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        
        let characterTypeLabelConstraint = [
            characterTypeLabel.topAnchor.constraint(equalTo: characterLocationLabel.bottomAnchor, constant: 30),
            characterTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterGenderLabelConstraint = [
            characterGenderLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50),
            characterGenderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        
        let characterOriginLabelConstraint = [
            characterOriginLabel.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 33),
            characterOriginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterLocationLabelConstraint = [
            characterLocationLabel.topAnchor.constraint(equalTo: characterOriginLabel.bottomAnchor, constant: 33),
            characterLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]

        NSLayoutConstraint.activate(characterImageViewConstraint)
        NSLayoutConstraint.activate(characterNameLabelConstraint)
        NSLayoutConstraint.activate(characterStatusLabelConstraint)
        NSLayoutConstraint.activate(characterSpeciesLabelConstraint)
        NSLayoutConstraint.activate(characterTypeLabelConstraint)
        NSLayoutConstraint.activate(characterGenderLabelConstraint)
        NSLayoutConstraint.activate(characterOriginLabelConstraint)
        NSLayoutConstraint.activate(characterLocationLabelConstraint)

    }
    
    func configure(with model: Character) {
        characterNameLabel.text = model.name
        characterStatusLabel.text = model.status
        characterSpeciesLabel.text = model.species
        characterTypeLabel.text = model.type
        characterGenderLabel.text = model.gender
        characterOriginLabel.text = "Origin: \(model.origin.name)"
        characterLocationLabel.text = "Location: \(model.location.name)"
        
        guard let url = URL(string: model.image) else {return}
        characterImageView.sd_setImage(with: url)
        
    }
    
}
