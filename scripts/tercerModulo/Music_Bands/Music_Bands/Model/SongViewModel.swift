//
//  SongViewModel.swift
//  Music_Bands
//
//  Created by Diplomado on 18/05/24.
//

import Foundation

class SongViewModel{
    var songs : [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    func getCountArray() -> Int {
        songs.count
    }
    
    func getNameOfSong (index: IndexPath) -> String{
        songs[index.row].title
    }
    
    func getDurationOfSong (index: IndexPath) -> String{
        songs[index.row].duration
    }
    
}

