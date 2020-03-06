//
//  PokemonListData.swift
//  PokeApiApp
//
//  Created by Tyler Little on 3/6/20.
//  Copyright © 2020 Tyler Little. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results:[PokemonResults]
}

struct PokemonResults: Codable {
    let name: String
    let url: String
}
