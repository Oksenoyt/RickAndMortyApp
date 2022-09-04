//
//  Cartoon.swift
//  RickAndMortyApp
//
//  Created by Elenka on 04.09.2022.
//

struct Cartoon: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let image: String
    let episode: [String]
}
