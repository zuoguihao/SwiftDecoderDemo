//
//  Test3Model.swift
//  SwiftDecoderDemo
//
//  Created by 左得胜 on 2017/12/18.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import Foundation

struct Test3Model: Codable {
    let id: Int
    let name: String
    let sex: SexType
    let cover: BookCover
    let photos: [PhotoCleanJSON]
    
    enum CodingKeys: String, CodingKey {
        case id, name, cover, photos, sex
    }
}
