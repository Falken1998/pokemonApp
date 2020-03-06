//
//  ListRequest.swift
//  PokeApiApp
//
//  Created by Tyler Little on 3/6/20.
//  Copyright © 2020 Tyler Little. All rights reserved.
//

import Foundation


enum PokemonError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct PokemonListRequest {
    let resourceURL: URL
    
    init() {
        let resourceString = "https://pokeapi.co/api/v2/pokemon/"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getPokemon(completion: @escaping(Result<[PokemonResults], PokemonError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let pokemonResponse = try decoder.decode(PokemonResponse.self, from: jsonData)
                let pokemonResults = pokemonResponse.results
                completion(.success(pokemonResults))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
