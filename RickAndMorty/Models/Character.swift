//
//  Character.swift
//  RickAndMorty
//
//  Created by Thiago Pereira on 19/05/23.
//

import Foundation

struct GetCharactersResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginElement
    let location: LocationElement
    let image: String
    let url: String
}

struct OriginElement: Codable {
    let name: String
    let url: String
}

struct LocationElement: Codable {
    let name: String
    let url: String
}
