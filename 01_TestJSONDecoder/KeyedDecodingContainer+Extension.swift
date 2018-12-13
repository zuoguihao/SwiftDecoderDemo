//
//  KeyedDecodingContainer+Extension.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2018/9/3.
//  Copyright © 2018年 左得胜. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    public func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        if let value = try? decode(type, forKey: key) {
            return value
        }
        if let value = try? decode(Int.self, forKey: key) {
            return value.description
        }
        if let value = try? decode(Float.self, forKey: key) {
            return value.description
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: Int.Type, forKey key: K) throws -> Int? {
        if let value = try? decode(type, forKey: key) {
            return value
        }
        if let value = try? decode(String.self, forKey: key) {
            return Int(value)
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: Double.Type, forKey key: K) throws -> Double? {
        if let value = try? decode(type, forKey: key) {
            return value
        }
        if let value = try? decode(String.self, forKey: key) {
            return Double(value)
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: Float.Type, forKey key: K) throws -> Float? {
        if let value = try? decode(type, forKey: key) {
            return value
        }
        if let value = try? decode(String.self, forKey: key) {
            return Float(value)
        }
        return nil
    }
    
    public func decodeIfPresent(_ type: Bool.Type, forKey key: K) throws -> Bool? {
        if let value = try? decode(type, forKey: key) {
            return value
        }
        if let value = try? decode(String.self, forKey: key) {
            if let valueInt = Int(value) {
                return Bool(valueInt != 0)
            }
            return nil
        }
        if let value = try? decode(Int.self, forKey: key) {
            return Bool(value != 0)
        }
        return nil
    }
    
    public func decodeIfPresent<T>(_ type: T.Type, forKey key: K) throws -> T? where T : Decodable {
        return try? decode(type, forKey: key)
    }
    
    func decodeIfPresent(_ type: Decimal.Type, forKey key: K) throws -> Decimal? {
        if let value = try? decode(Decimal.self, forKey: key) {
            return value
        }
        if let value = try? decode(String.self, forKey: key) {
            return Decimal.init(string: value)
        }
        return nil
    }
    
}
