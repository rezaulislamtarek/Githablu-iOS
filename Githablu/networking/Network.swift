//
//  Network.swift
//  Githablu
//
//  Created by Rezaul Islam on 29/6/23.
//

import Foundation
import UIKit

class NetWork {
    private let baseUrl:String = "https://api.github.com/"
    static let instance = NetWork()
    private let cache = NSCache<NSString, UIImage>()
    
    func getDataList<ModelObject: Decodable>(from endPoint: String, completed: @escaping (Result<[ModelObject], Error>) -> Void) {
        guard let url = URL(string: baseUrl+endPoint) else {
            print("error in URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("error in step 2: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("invalid response")
                return
            }
            
            guard let data = data else {
                print("invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([ModelObject].self, from: data)
                completed(.success(decodedData))
            } catch {
                print("invalid data: \(error)")
                completed(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
    func getDataObject<ModelObject: Decodable>(from endPoint: String, completed: @escaping (Result<ModelObject, Error>) -> Void) {
        guard let url = URL(string: baseUrl+endPoint) else {
            print("error in URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("error in step 2: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("invalid response")
                return
            }
            
            guard let data = data else {
                print("invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ModelObject.self, from: data)
                completed(.success(decodedData))
            } catch {
                print("invalid data: \(error)")
                completed(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
    
    func downloadImage(from urlString: String,  complited: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            complited(image)
        }
        
        guard let url = URL(string: urlString) else {
            complited(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                complited(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            complited(image)
        }
        task.resume()
        
    }
    
    
}
