//
//  Post.swift
//  Fakestagram
//
//  Created by Diplomado on 07/06/24.
//

import Foundation

struct Post: Decodable{
    var id: Int
    var userId: Int
    var title: String
    var body: String
    
    init(postDTO : PostDTO?) throws{
        guard let postDTO else {throw UserModelError.userNotFound}
        
        id = postDTO.id ?? -1
        userId = postDTO.userId ?? -1
        title = postDTO.title ?? ""
        body = postDTO.body ?? ""
    }
}
