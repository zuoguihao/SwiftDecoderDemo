//
//  Test2Model.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2017/11/15.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import Foundation

struct Swifter: Decodable {
    let fullName: String
    var id: String
    let twitter: URL
    
    init(fullName: String, id: String, twitter: URL) { // default struct initializer
        self.fullName = fullName
        self.id = id
        self.twitter = twitter
    }
}

extension Swifter {
    enum MyStructKeys: String, CodingKey { // declaring our keys
        case fullName = "fullName"
        case id = "id"
        case twitter = "twitter"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let fullName: String = try container.decode(String.self, forKey: .fullName) // extracting the data
        
        // 法1：
        let ids: String
        if let id: String = try? container.decode(String.self, forKey: .id) {
            ids = id
        } else {
            ids = String(describing: try container.decode(Int.self, forKey: .id))
        } // extracting the data
        
        // 法2：只有该方法才能行得通
//        let id: Int
//        do {
//            id = try container.decode(Int.self, forKey: .id)
//        } catch {
//            let idStr = try container.decode(String.self, forKey: .id)
//            id = Int(idStr) ?? 0
//        }
        
        // 法3：
//        let id: Int = Int(try container.decode(String.self, forKey: .id)) ?? 0
        
        
        
        let twitter: URL = try! container.decode(URL.self, forKey: .twitter) // extracting the data

        self.init(fullName: fullName, id: ids, twitter: twitter) // initializing our struct
    }
}

/// 尝试扩展协议，不行！！！
extension KeyedDecodingContainerProtocol {
    func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        do {
            return try decode(Int.self, forKey: key)
        } catch {
            return Int(try decode(String.self, forKey: key)) ?? 0
        }
    }
}



