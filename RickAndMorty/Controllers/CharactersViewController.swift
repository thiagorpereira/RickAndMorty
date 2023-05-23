//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 19/05/23.
//

import UIKit

class CharactersViewController: UIViewController {
    
    private var characters: [Character] = [Character]()
    private var headerCharacterTableView: HeaderCharacterTableView?
    var currentPage = 1
    var network: NetworkProtocol?
    
    private let characterTable: UITableView = {
       let table = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(characterTable)
        characterTable.delegate = self
        characterTable.dataSource = self
        
        
        headerCharacterTableView = HeaderCharacterTableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 120))
        characterTable.tableHeaderView = headerCharacterTableView
        

        fetchCharacters()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterTable.frame = view.bounds
    }
    
    func fetchCharacters() {
        network?.fetchCharacters(completion: { [weak self] charactersData in
            self?.characters = charactersData
            DispatchQueue.main.async {
                self?.characterTable.reloadData()
            }
        })
    }
    
    func fetchMoreCharactersOnScroll(for indexPath: IndexPath) {
        let lastRowIndex = characterTable.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            currentPage += 1
            network?.fetchMoreCharactersOnScroll(currentPage: currentPage, for: indexPath, completion: { [weak self] charactersData in
                self?.characters.append(contentsOf: charactersData)
                DispatchQueue.main.async {
                    self?.characterTable.reloadData()
                }
            })
        }
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]

        cell.configure(with: CharacterMainViewModel(name: character.name , imageURL: character.image, species: character.species ))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        fetchMoreCharactersOnScroll(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        let vc = CharacterDetailsViewController()
        vc.configure(with: character)
        navigationController?.pushViewController(vc, animated: true)
    }
}
