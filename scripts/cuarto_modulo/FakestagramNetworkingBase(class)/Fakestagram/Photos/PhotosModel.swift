//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class PhotosModel {
    var photos: [Photo]?
    
    func photo(for index: Int) -> Photo? {
        photos?[index]
    }
    
    func getNumberOfPhotos() -> Int {
        photos?.count ?? 0
    }
    
}

extension PhotosModel {
    func getPhoto() throws {
        guard let url = Bundle.main.url(forResource: "Photos", withExtension: "json") , let data = try? Data(contentsOf: url) else { throw UserModelError.fileError }
        
        let photosDTOS = try [PhotoDTO](data: data)
        photos = photosDTOS.enumerated().map { (index, photo) in
            if index == 0 {
                Photo(image: .dog1, caption: photo.title)
            } else if index % 2 == 0 {
                Photo(image: .images4, caption: photo.title)
            }else {
                Photo(image: .dog2Jpg, caption: photo.title)
            }
        }
        
    }
    
    func getPhotos(userID: Int, completionHandler: @escaping (Error?)->Void){
        guard let request = buildRequest(byQuery: true, userID: userID) else {
            completionHandler(UserModelError.badRequest)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, resp, error in
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
                let photosDTO = try [PhotoDTO](data: data)
                self?.downloadPhotos(for: photosDTO){ photos in
                    self?.photos = photos
                    completionHandler(nil)
                }
                //self?.saveUser(from: photosDTO)
                
            } catch {
                completionHandler(error)
                
            }
            
            
        }
        
        task.resume()
    }
    
    func downloadPhotos(for dtos: [PhotoDTO], completion: @escaping ([Photo]) -> Void){
        //let queue = DispatchQueue(label: "photo.queue", attributes: .concurrent)
        DispatchQueue.global().async {
            let group = DispatchGroup()
            let semaphore = DispatchSemaphore(value: 3)
            var photos = [Photo]()
            
            for dto in dtos {
                guard let urlString = dto.utl, let url = URL(string: urlString) else { continue }
                let request = URLRequest(url: url)
                semaphore.wait()
                group.enter()
                let task = URLSession.shared.dataTask(with: request){ data, response, error in
                    if let data, let image = UIImage(data: data) {
                        photos.append(Photo(image: image, caption: dto.title))
                    }
                    group.leave()
                    semaphore.signal()
                }
                task.resume()
                completion(photos)
            }
        }
        
    }
    
    func buildRequest(byQuery: Bool, userID: Int)->URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.queryItems = [
            URLQueryItem(name: "_page", value: "1"),
            URLQueryItem(name: "_limit", value: "10")
        ]
        if byQuery {
            components.queryItems?.append(URLQueryItem(name: "userID", value: "\(userID)"))
        }else {
            components.path = "/users/\(userID)/photos"
        }
        
        guard let url = components.url else {
         return nil
        }
        
        return URLRequest(url: url)
    }
}
