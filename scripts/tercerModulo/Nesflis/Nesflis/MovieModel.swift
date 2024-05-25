//
//  MovieModel.swift
//  Nesflis
//
//  Created by Diplomado on 25/05/24.
//

import Foundation

// let array = ["Buscando a nemo","Annabelle","Barbie","El rey leon", "El padrino", "El padrino", "Spiderman","Harry Potter", "Eso" , "Yo antes de ti"]

enum Genre{
    case animated, horror, adventure
    
    var toString : String {
        switch self {
        case .animated:
            "Animated"
        case .horror:
            "Horror"
        case .adventure:
            "Adventure"
        }
    }
}

struct Movie {
    var name : String
    var imageName : String
    var genre : Genre
}


class MovieModel {
    var movies : [Movie] = []
    
    init(){
        movies = [
            Movie(name: "Buscando a nemo",imageName: "Buscando a nemo",genre: .animated),
            Movie(name: "Annabelle",imageName: "Annabelle",genre: .horror),
            Movie(name: "Barbie",imageName: "Barbie",genre: .adventure),
            Movie(name: "El rey leon",imageName: "El rey leon",genre: .animated),
            Movie(name: "El padrino",imageName: "El padrino",genre: .adventure),
            Movie(name: "Spiderman",imageName: "Spiderman",genre: .adventure),
            Movie(name: "Harry Potter",imageName: "Harry Potter",genre: .adventure),
            Movie(name: "Eso",imageName: "Eso",genre: .horror)
        ]
    }
    
    func getSizeOfMovies() -> Int{
        movies.count
    }
    
    func getArrayOfGenre(genre : Genre) -> [Movie]{
        movies.filter { $0.genre == genre }
    }
    
}

