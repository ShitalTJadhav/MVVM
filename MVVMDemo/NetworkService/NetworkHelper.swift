//
//  NetworkHelper.swift
//  MVVMDemo
//
//  Created by Tushar  Jadhav on 2019-01-09.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
}

class NetworklHelper {
    
    static let shared = NetworklHelper()
    
   // private init(){}
    
    func fetchData<T: Decodable>(urlString: String,  completion: @escaping (Result<T>) -> ()) {
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //Check internet connection
        if let reachability = Reachability(), !reachability.isReachable {
            request.cachePolicy = .returnCacheDataDontLoad
        }

        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch data:", err)
                DispatchQueue.main.async {
                    completion(Result.failure("Url is not proper"))
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(obj))
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion(Result.failure("Getting error in parsing"))
            }
            }.resume()
    }
    
}
