//
//  NetworkProtocol.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 22/05/23.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func fetchCharacters(completion: @escaping ([Character]) -> Void)
    func fetchMoreCharactersOnScroll(currentPage: Int, for indexPath: IndexPath, completion: @escaping ([Character]) -> Void)
}

struct Network: NetworkProtocol {
    func fetchMoreCharactersOnScroll(currentPage: Int, for indexPath: IndexPath, completion: @escaping ([Character]) -> Void) {
        
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(currentPage)"

        AF.request(urlString).responseDecodable(of: GetCharactersResponse.self) { response in
            switch response.result {
            case .success(let resp):
                completion(resp.results)
            case .failure(let error):
                print("Error on fetch more Characters: \(error)")
            }
        }

    }
    
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"

        AF.request(url).responseDecodable(of: GetCharactersResponse.self) { response in
            switch response.result {
            case .success(let resp):
                completion(resp.results)
            case .failure(let error):
                print("Error on fetch Characters: \(error)")
            }
        }
    }
    

}
