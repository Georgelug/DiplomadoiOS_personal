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
            "Fuego"
        case .agua:
            "Agua"
        case .electrico:
            "Electrico"
        case .planta:
            "Planta"
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
    
    var description : String {
        switch self {
        case .fuego:
                        """
                        Double Damage Dealt (Super Effective): Grass
                        Double Damage Received (Weak): Water & Ground
                        Half Damage Dealt (Not Very Effective): Water
                        Half Damage Received (Resistant): Fire & Grass
                        Not Affected By (Immune): None
                        No Effect Against: None
                        """
        case .agua:
                        """
                        Double Damage Dealt (Super Effective): Fire & Grass
                        Double Damage Received (Weak): Grass & Electric
                        Half Damage Dealt (Not Very Effective): Fire & Grass
                        Half Damage Received (Resistant): Water & Ice
                        Not Affected By (Immune): None
                        No Effect Against: None
                        """
        case .electrico:
                        """
                        Double Damage Dealt (Super Effective): Water
                        Double Damage Received (Weak): Fire, Poison, Bug, Flying, Ice
                        Half Damage Dealt (Not Very Effective): Fire & Electric
                        Half Damage Received (Resistant): Water & Ground
                        Not Affected By (Immune): None
                        No Effect Against: None
                        """
        case .planta:
                        """
                        Double Damage Dealt (Super Effective): Water
                        Double Damage Received (Weak): Fire, Poison, Bug, Flying, Ice
                        Half Damage Dealt (Not Very Effective): Fire & Electric
                        Half Damage Received (Resistant): Water & Ground
                        Not Affected By (Immune): None
                        No Effect Against: None
                        """
        }
    }
    
}


struct Pokemon{
    
    var name : String
    var type : PokeType
    var weaknesses : [PokeType]
    var image : String
    var description : String
    var number : Int
    var favorite : Bool = false
    var chainEvolution : String = ""
    
}


class PokeModel{
    var pokemones : [Pokemon] = []
    
    init(){
        pokemones = [
            Pokemon(name: "Bulbasaur", type: .planta,weaknesses: [.fuego], image: "Bulbasaur", description: "Tras nacer, crece alimentándose durante un tiempo de los nutrientes que contiene el bulbo de su lomo.", number: 1),
            Pokemon(name: "Ivysaur", type: .planta,weaknesses: [.fuego], image: "Ivysaur", description: "Cuanta más luz solar recibe, más aumenta su fuerza y más se desarrolla el capullo que tiene en el lomo.", number: 2),
            Pokemon(name: "Charmander", type: .fuego,weaknesses: [.agua], image: "Charmander", description: "La llama de su cola indica su fuerza vital. Si está débil, la llama arderá más tenue.", number: 4),
            Pokemon(name: "Charmeleon", type: .fuego,weaknesses: [.agua], image: "Charmeleon", description: "Al agitar su ardiente cola, eleva poco a poco la temperatura a su alrededor para sofocar a sus rivales.", number: 5),
            Pokemon(name: "Squirtle", type: .agua,weaknesses: [.planta,.electrico], image: "Squirtle", description: "Tras nacer, se le hincha el lomo y se le forma un caparazón. Escupe poderosa espuma por la boca.", number: 7),
            Pokemon(name: "Wartortle", type: .agua,weaknesses: [.planta,.electrico], image: "Wartortle", description: "Tiene una cola larga y peluda que simboliza la longevidad y lo hace popular entre los mayores.", number: 8,favorite: true)
        ]
    }
    
    func getSizePokemonesList()->Int{
        pokemones.count
    }
    
    func getPokemonFromPokemonesList(indexPath: IndexPath) -> Pokemon{
        pokemones[indexPath.row]
    }
    
    func getPokeFavs() -> [Pokemon] {
        pokemones.filter { $0.favorite }
    }
    
    func setPokeToFavs(indexPath : IndexPath){
        pokemones[indexPath.row].favorite = true
    }
}


class PokeTypeModel {
    var pokeTypes : [PokeType] = []
    init(){
        pokeTypes = [
            .agua,
            .electrico,
            .fuego,
            .planta
        ]
    }
    
    func getSizeTypesList() -> Int{
        pokeTypes.count
    }
    
    func getPokeTypeFromPokeTypes(indexPath : IndexPath) -> PokeType{
        pokeTypes[indexPath.row]
    }
}
