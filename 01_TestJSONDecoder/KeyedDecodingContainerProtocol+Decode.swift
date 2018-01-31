//
//  KeyedDecodingContainerProtocol+Decode.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2018/1/31.
//  Copyright © 2018年 左得胜. All rights reserved.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    /// 解码为 int 值，不成功返回默认值，默认为 -1
    public func ds_decode(_ type: Int.Type, forKey key: Key, defaultValue: Int = -1) -> Int {
        return (try? decode(Int.self, forKey: key)) ?? defaultValue
    }
    
    /// 解码为 string 值，不成功返回默认值，默认为""
    public func ds_decode(_ type: String.Type, forKey key: Key, defaultValue: String = "") -> String {
        if let a = try? decode(String.self, forKey: key) {
            return a
        } else {
            if let a = try? decode(Int.self, forKey: key) {
                return a.description
            } else {
                if let a = try? decode(Double.self, forKey: key) {
                    return a.description//NSDecimalNumber.init(string: String(a)).stringValue
                } else {
                    return defaultValue
                }
            }
            
        }
    }
    
}
