//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 19/05/23.
//

import UIKit
import Alamofire

class CharactersViewController: UIViewController {
    
    private var characters: [Character] = [Character]()
    var currentPage = 1
    
    private let characterTable: UITableView = {
       let table = UITableView()
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(characterTable)
        characterTable.delegate = self
        characterTable.dataSource = self
        
        fetchCharacters()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        characterTable.frame = view.bounds
    }
    
    private func fetchCharacters() {

        let url = "https://rickandmortyapi.com/api/character"

        AF.request(url).responseDecodable(of: GetCharactersResponse.self) { [weak self] response in
            switch response.result {
            case .success(let resp):
                self?.characters = resp.results
                DispatchQueue.main.async {
                    self?.characterTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchMoreCharactersOnScroll(for indexPath: IndexPath) {
        let lastRowIndex = characterTable.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            currentPage += 1

            let urlString = "https://rickandmortyapi.com/api/character/?page=\(currentPage)"

            AF.request(urlString).responseDecodable(of: GetCharactersResponse.self) { [weak self] response in
                switch response.result {
                case .success(let resp):
                    self?.characters.append(contentsOf: resp.results)
                    DispatchQueue.main.async {
                        self?.characterTable.reloadData()
                    }
                case .failure(let error):
                    print("Error on fetch more Characters: \(error)")
                }
            }
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
        print("clickou")
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = TitlePreviewViewController()
//        vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: title.overview ?? ""))
//        self?.navigationController?.pushViewController(vc, animated: true)
        let character = characters[indexPath.row]
        let vc = CharacterDetailsViewController()
        vc.configure(with: character)
        navigationController?.pushViewController(vc, animated: true)
    }
}
