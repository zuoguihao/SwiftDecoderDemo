//
//  KeyedDecodingContainerProtocol+Decode.swift
//  RefuelingAssistant
//
//  Created by 左得胜 on 2018/1/31.
//  Copyright © 2018年 zds. All rights reserved.
//

import Foundation

extension KeyedDecodingContainerProtocol {
    /// 解码为 string 值，不成功返回默认值，默认为""
    public func ds_decode(_ type: String.Type, forKey key: Key, defaultValue: String = "") -> String {
        if let a = try? decode(String.self, forKey: key) {
            return a
        }
        if let a = try? decode(Int.self, forKey: key) {
            return a.description
        }
        if let a = try? decode(Float.self, forKey: key) {
            return a.description
        }
        return defaultValue
    }
    
    /// 解码为 int 值，不成功返回默认值，默认为 -1
    public func ds_decode(_ type: Int.Type, forKey key: Key, defaultValue: Int = -1) -> Int {
        if let a = try? decode(Int.self, forKey: key) {
            return a
        }
        if let a = try? decode(String.self, forKey: key) {
            return Int(a) ?? defaultValue
        }
        return defaultValue
    }
    
    /// 解码为 Float 值，不成功返回默认值，默认为 0
    public func ds_decode(_ type: Float.Type, forKey key: Key, defaultValue: Float = 0) -> Float {
        if let a = try? decode(Float.self, forKey: key) {
            return a
        }
        if let a = try? decode(String.self, forKey: key) {
            return Float(a) ?? defaultValue
        }
        return defaultValue
    }
    
    /// 解码为 Bool 值，不成功返回默认值，默认为 false
    public func ds_decode(_ type: Bool.Type, forKey key: Key, defaultValue: Bool = false) -> Bool {
        if let a = try? decode(Bool.self, forKey: key) {
            return a
        }
        if let a = try? decode(String.self, forKey: key) {
            return Int(a) == 1 ? true : false
        }
        return defaultValue
    }
    
    /// 解码为对象，不成功返回默认值，默认为 nil
    public func ds_decode<T: Decodable>(_ type: T.Type, forKey key: Key, defaultValue: T? = nil) -> T? {
        if let a = try? decode(type, forKey: key) {
            return a
        }
        return defaultValue
    }
    
    /// 解码为 Decimal 值，不成功返回默认值，默认为 -1
    public func ds_decode(_ type: Decimal.Type, forKey key: Key, defaultValue: Decimal = -1) -> Decimal {
        if let a = try? decode(Decimal.self, forKey: key) {
            return a
        }
        if let a = try? decode(String.self, forKey: key) {
            return Decimal.init(string: a) ?? defaultValue
        }
        return defaultValue
    }
    
}

