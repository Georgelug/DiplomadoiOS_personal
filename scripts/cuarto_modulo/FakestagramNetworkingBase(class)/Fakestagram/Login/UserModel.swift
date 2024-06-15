//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

class UserModel {
    var user : User? {
        didSet {
            Settings.user = user
        }
    }
    
    
}

enum UserModelError: Error, LocalizedError {
    case userNotFound
    case fileError
    case parsingError
    case badRequest
    
    
    var errorDescription: String? {
        switch self {
        case .fileError:
            "User not found"
        case .userNotFound:
            "File not found"
        case .parsingError:
            "Could not parse response"
        case .badRequest:
            "Bad request"
        }
    }
}


extension UserModel {
    
    func saveUser(from dto: UserDTO){
        guard let id = dto.id, let name = dto.name, let email = dto.email, let username = dto.username else { return }
        user = User(id: id, name: name, username: username, email: email)
    }
    
    func findUser(email: String, completionHandler: @escaping (Error?)->Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users?email=Sincere@april.biz") else {
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
                guard let data, let userDTO = (try [UserDTO](data: data)).first else{
                    completionHandler(UserModelError.userNotFound)
                    return
                }
                self?.saveUser(from: userDTO)
                completionHandler(nil)
            } catch {
                completionHandler(error)
            }
           
            
        }
        
        task.resume()
        
    }
    
}

