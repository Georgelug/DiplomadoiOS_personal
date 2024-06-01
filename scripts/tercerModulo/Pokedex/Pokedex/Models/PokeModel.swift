//
//  PokeModel.swift
//  Pokedex
//
//  Created by Diplomado on 31/05/24.
//

import Foundation

enum PokeType{
    case fuego, agua, electrico, planta
    
    var name : String {
        switch self {
        case .fuego:
            "fuego"
        case .agua:
            "agua"
        case .electrico:
            "electrico"
        case .planta:
            "planta"
        }
    }
    
    var image : String {
        switch self {
        case .fuego:
            "fuego.png"
        case .agua:
            "agua.png"
        case .electrico:
            "electrico.png"
        case .planta:
            "planta.png"
        }
    }
    
}


struct Pokemon{
    var name : String
    var type : PokeType
    var image : String
    var description : String
    var number : Int
    var favorite : Bool = false
}


class PokeModel{
    var pokemones : [Pokemon] = [
        Pokemon(name: "", type: .agua, image: "", description: "", number: 0)
    ]
}
