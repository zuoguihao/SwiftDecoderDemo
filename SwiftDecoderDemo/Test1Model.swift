//
//  Test1Model.swift
//  SwiftDecoderDemo
//
//  Created by 左佳林 on 2019/10/14.
//  Copyright © 2019 左得胜. All rights reserved.
//

import Foundation

struct Test1Model: Codable {
    let id: Int
    let name: String
    let cover: BookCover
    let photos: [PhotoSystem]
    
    enum CodingKeys: String, CodingKey {
        case id, name, cover, photos
    }
}



