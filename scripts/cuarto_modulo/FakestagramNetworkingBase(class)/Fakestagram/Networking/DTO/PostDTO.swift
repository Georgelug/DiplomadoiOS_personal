//
//  PostDTO.swift
//  Fakestagram
//
//  Created by Diplomado on 07/06/24.
//

import Foundation

struct PostDTO: Decodable{
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
}
