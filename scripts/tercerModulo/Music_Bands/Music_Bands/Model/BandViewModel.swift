//
//  BandViewModel.swift
//  Music_Bands
//
//  Created by Diplomado on 18/05/24.
//

import Foundation


class BandViewModel{
    var bands : [Band]
    
    init(){
        bands = [
            Band(name: "Avicii", albums: [
                Album(name: "Stories", songs:[
                    Song(title: "Waiting For Love", duration: "3:50")
                ])
            ]),
            Band(name: "Daft Punk", albums: [
                Album(name: "Discovery", songs:[
                    Song(title: "One More Time", duration: "5:20")
                ])
            ])
        
        ]
    }
    
    func getCountArray() -> Int {
        bands.count
    }
    
    func getNameOfBand (index: IndexPath) -> String{
        bands[index.row].name
    }
    
    func getAlbumsOfBand (index: IndexPath) -> [Album]{
        bands[index.row].albums
    }
    
}
