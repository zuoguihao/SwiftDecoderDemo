//
//  CleanJSON+CustomAdapter.swift
//  SwiftDecoderDemo
//
//  Created by 左佳林 on 2019/10/14.
//  Copyright © 2019 左得胜. All rights reserved.
//

import CleanJSON

struct CustomAdapter: JSONAdapter {
    
    // 由于 Swift 布尔类型不是非 0 即 true，所以默认没有提供类型转换。
    // 如果想实现 Int 转 Bool 可以自定义解码。
    func adapt(_ decoder: CleanDecoder) throws -> Bool {
        // 值为 null
        if decoder.decodeNil() {
            return false
        }
        
        if let intValue = try decoder.decodeIfPresent(Int.self) {
            // 类型不匹配，期望 Bool 类型，实际是 Int 类型
            return intValue != 0
        }
        
        return false
    }
    
    // 为避免精度丢失所以没有提供浮点型转整型
    // 可以通过下面适配器进行类型转换
    func adapt(_ decoder: CleanDecoder) throws -> Int {
        guard let doubleValue = try decoder.decodeIfPresent(Double.self) else { return 0 }
        
        return Int(doubleValue)
    }
    
    // 可选的 URL 类型解析失败的时候返回一个默认 url
    func adaptIfPresent(_ decoder: CleanDecoder) throws -> URL? {
        return URL(string: "https://google.com")
    }
}
