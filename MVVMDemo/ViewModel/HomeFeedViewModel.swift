//
//  HomeFeedViewModel.swift
//  MVVMDemo
//
//  Created by Tushar  Jadhav on 2019-01-09.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import Foundation

class HomeFeedViewModel {

    weak var service :NetworklHelper!
    
    var dataModelArray = [Video]()
    
    init(service : NetworklHelper = NetworklHelper.shared) {
        self.service = service
    }
    
    
    // MARK: - Web service methods
    
    func fetchHomeFeedData(completion: @escaping (Bool) -> ()){
        
        if self.service == nil {
            DispatchQueue.main.async {
                completion(false)
            }
            return
        }
        
        let urlString = "https://api.letsbuildthatapp.com/youtube/home_feed"
        
        self.service.fetchData(urlString: urlString, completion: {[weak self] (result: Result<HomeFeed>) in
            
            switch(result){
            case let .success(homeFeed):
                homeFeed.videos.forEach({print($0.name)})
                self?.dataModelArray = homeFeed.videos
                DispatchQueue.main.async {
                    completion(true)
                }
                break
            case .failure:
                DispatchQueue.main.async {
                    completion(false)
                }
                break
            }
//            if let err = error {
//                print("Failed to fetch games:", err)
//                completion(false)
//            }
            
           // self?.dataModelArray = games?.map({return GameViewModel(game: $0)}) ?? []
        })
    }
    
}
