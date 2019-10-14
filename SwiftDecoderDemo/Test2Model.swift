//
//  Test2Model.swift
//  SwiftDecoderDemo
//
//  Created by 左得胜 on 2017/11/15.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import Foundation

struct Test2Model: Codable {
    let id: Int
    let name: String
    let cover: BookCover
    var photos: [PhotoMy]
}

extension Test2Model {
    enum MyStructKeys: String, CodingKey {
        case id, name, cover, photos
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MyStructKeys.self)
        
        id = values.ds_decode(Int.self, forKey: .id)
        name = values.ds_decode(String.self, forKey: .name)
        cover = values.ds_decode(BookCover.self, forKey: .cover) ?? BookCover(url: "", thumbURL: "")
        photos = values.ds_decode([PhotoMy].self, forKey: .photos) ?? []
    }
}
