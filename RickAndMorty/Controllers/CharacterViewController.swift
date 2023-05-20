//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 19/05/23.
//

import UIKit
import Alamofire

class CharacterViewController: UIViewController {
    
    private var characters: [Character] = [Character]()
    
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
//        print("OLA")
//        AF.request("https://httpbin.org/get").response { response in
//            print("ue@ \(response)")
//        }
        
        let url = "https://rickandmortyapi.com/api/character"

        AF.request(url).responseDecodable(of: GetCharactersResponse.self) { [weak self] response in
            switch response.result {
            case .success(let resp):
                // Processar os dados dos usuários
                self?.characters = resp.results
                DispatchQueue.main.async {
                    self?.characterTable.reloadData()
                }
//                for i in resp.results {
//                    print(i.name)
//                }
            case .failure(let error):
                // Lidar com erros
                print(error)
            }
        }
    }
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]
        print("CH1 \(character)")

        cell.configure(with: CharacterMainViewModel(name: character.name , imageURL: character.image ))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}
