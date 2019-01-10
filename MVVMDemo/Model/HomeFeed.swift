//
//  HomeFeed.swift
//  MVVMDemo
//
//  Created by Tushar  Jadhav on 2019-01-09.
//  Copyright © 2019 Shital  Jadhav. All rights reserved.
//

import Foundation

struct HomeFeed: Decodable {
    
    let videos: [Video]
}

struct Video: Decodable {
    let id: Int
    let name: String
    
    //Using Mapable protocol instead of Decodable
//    mutating func mapping(map: Map) {
//         Id <- map["id"]
//         name <- map["name"]
//    }

    
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case Id = "id"
//    }
}
