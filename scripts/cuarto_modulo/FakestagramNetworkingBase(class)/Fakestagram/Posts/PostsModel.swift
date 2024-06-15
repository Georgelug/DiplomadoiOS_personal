//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

class PostsModel {
    var posts: [Post]?
    
    func post(for index: Int) -> Post? {
        posts?[index]
    }
    
    func getNumberOfPosts() -> Int {
        posts?.count ?? 0
    }
}


extension PostsModel {
    func getPost() throws {
        
        guard let url = Bundle.main.url(forResource: "Posts", withExtension: "json") , let data = try? Data(contentsOf: url) else { throw UserModelError.fileError }
        
        let postDTOS = try [PostDTO](data: data)
        posts = try postDTOS.enumerated().map { (index, postDTO) in
            try Post(postDTO: postDTO)
        }
        
    }
    
    func getPost(completionHandler: @escaping (Error?)->Void ){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completionHandler(UserModelError.badRequest)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, resp, error in
            if let error {
                completionHandler(error)
                return
            }else {
                
                guard let httpResponse = (resp as? HTTPURLResponse) else {
                    completionHandler(UserModelError.badRequest)
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    completionHandler(UserModelError.parsingError)
                    return
                }
                
            }
            do{
                guard let data else{
                    completionHandler(UserModelError.userNotFound)
                    return
                }
                
                let postDTOS = try [PostDTO](data: data)
                
                self?.posts = try postDTOS.enumerated().map { (index, postDTO) in
                    try Post(postDTO: postDTO)
                }
                completionHandler(nil)
            } catch {
                completionHandler(error)
            }
           
            
        }
        
        task.resume()
        

    }

}
