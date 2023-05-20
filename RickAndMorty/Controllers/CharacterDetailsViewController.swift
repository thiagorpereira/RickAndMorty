//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 20/05/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
//    struct Character: Codable {
//        let id: Int
//        let name: String
//        let status: String
//        let species: String
//        let type: String
//        let gender: String
//        let origin: OriginElement
//        let location: LocationElement
//        let image: String
//        let url: String
//    }
//
//    struct OriginElement: Codable {
//        let name: String
//        let url: String
//    }
//
//    struct LocationElement: Codable {
//        let name: String
//        let url: String
//    }
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterSpeciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterOriginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let characterLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
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


    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
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
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 30),
            characterSpeciesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterTypeLabelConstraint = [
            characterTypeLabel.topAnchor.constraint(equalTo: characterSpeciesLabel.bottomAnchor, constant: 30),
            characterTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        
        let characterGenderLabelConstraint = [
            characterGenderLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 50),
            characterGenderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]

        
        
        NSLayoutConstraint.activate(characterImageViewConstraint)
        NSLayoutConstraint.activate(characterNameLabelConstraint)
        NSLayoutConstraint.activate(characterStatusLabelConstraint)
        NSLayoutConstraint.activate(characterSpeciesLabelConstraint)
        NSLayoutConstraint.activate(characterTypeLabelConstraint)
        NSLayoutConstraint.activate(characterGenderLabelConstraint)

    }
    
    func configure(with model: Character) {
        print("model name: \(model.name)")
        print("model type: \(model.type)")
        characterNameLabel.text = model.name
        characterStatusLabel.text = model.status
        characterSpeciesLabel.text = model.species
        characterTypeLabel.text = model.type
        characterGenderLabel.text = model.gender
        characterOriginLabel.text = model.origin.name
        characterLocationLabel.text = model.location.name
        
        guard let url = URL(string: model.image) else {return}
        characterImageView.sd_setImage(with: url)
        
    }
    
}
