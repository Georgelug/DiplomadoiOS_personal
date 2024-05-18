//
//  AlbumViewModel.swift
//  Music_Bands
//
//  Created by Diplomado on 18/05/24.
//

import Foundation

class AlbumViewModel{
    var albums : [Album]
    
    init(albums: [Album]) {
        self.albums = albums
    }
    
    func getCountArray() -> Int {
        albums.count
    }
    
    func getNameOfAlbum (index: IndexPath) -> String{
        albums[index.row].name
    }
    
    func getSongsOfAlbum (index: IndexPath) -> [Song]{
        albums[index.row].songs
    }
    
}



