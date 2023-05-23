//
//  NetworkProtocolSpy.swift
//  RickAndMortyTests
//
//  Created by Thiago Pereira on 22/05/23.
//

import Foundation
@testable import RickAndMorty

struct NetworkProtocolSpy: NetworkProtocol {
    
    let characters = [RickAndMorty.Character(
        id: 1,
        name: "Thiago",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "male",
        origin: OriginElement(name: "Earth", url: ""),
        location: LocationElement(name: "Brasilia", url: ""),
        image: "",
        url: ""
    )]
    
    func fetchCharacters(completion: @escaping ([RickAndMorty.Character]) -> Void) {
        completion(characters)
    }
    
    func fetchMoreCharactersOnScroll(currentPage: Int, for indexPath: IndexPath, completion: @escaping ([RickAndMorty.Character]) -> Void) {
        completion(characters)
    }
}
