//
//  Test4.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2018/12/13.
//  Copyright © 2018 左得胜. All rights reserved.
//

import Foundation

struct BookCover: Codable {
    let url: String
    let thumbURL: String
    
    enum CodingKeys: String, CodingKey {
        case thumbURL = "thumb_url", url
    }
}

struct PhotoSystem: Codable {
    let id: String
    let owner: String
    
    /// 这里由于用了KeyedDecodingContainer+Extension扩展，只要结尾用？包装，用let、var结果一样
    let farm: String?
    let ispublic: Int
}

struct PhotoMy: Codable {
    let id: String
    let owner: String
    
    let farm: String
    let ispublic: Bool
    
    enum MyStructKeys: String, CodingKey {
        case id, owner, farm, ispublic
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MyStructKeys.self)
        
        id = values.ds_decode(String.self, forKey: .id)
        owner = values.ds_decode(String.self, forKey: .owner)
        farm = values.ds_decode(String.self, forKey: .farm)
        ispublic = values.ds_decode(Bool.self, forKey: .ispublic)
    }
}

struct PhotoCleanJSON: Codable {
    let id: String
    let owner: String
    
    let farm: String
    let ispublic: Bool
}
