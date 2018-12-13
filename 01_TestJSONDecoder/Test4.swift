//
//  Test4.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2018/12/13.
//  Copyright © 2018 左得胜. All rights reserved.
//

import Foundation

struct Book: Codable {
    let id: Int
    let name: String
    let cover: BookCover?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cover
    }
    
    struct BookCover: Codable {
        
        var url: String
        var thumbURL: String
        
        enum CodingKeys: String, CodingKey {
            case url
            case thumbURL = "thumb_url"
        }
    }
}
