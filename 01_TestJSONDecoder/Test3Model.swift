//
//  Test3Model.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2017/12/18.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import Foundation

/// 加油报表列表
struct Test3Model: Decodable {
    /// 当天
    var day: RAReportForm_DayModel
    /// 当月
    var month: RAReportForm_DayModel
    /// 上月
    var last_month: RAReportForm_DayModel
    var year: RAReportForm_DayModel
    var last_year: RAReportForm_DayModel
}

struct RAReportForm_DayModel: Decodable {
    /// 当天/当月/上月服务的总笔数
    var order_num: Int
    /// 当天/当月/上月服务的总升数
    var oil_num: String
    
    enum MyStructKeys: String, CodingKey {
//        case order_num = "order_num"
//        case oil_num = "oil_num"
        case order_num, oil_num
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        
        // oil_num key 的处理
        // 方案一：抛出错误，因为 null 不能处理，【舍弃】
//        if let num = try? container.decode(String.self, forKey: .oil_num) {
//            oil_num = num
//        } else {
//            oil_num = String(try container.decode(Double.self, forKey: .oil_num))
//        }

        // 方案二：通过，但是代码增加了一个变量，并且有强转符号，不推荐【舍弃】
//        var a = try? container.decode(String.self, forKey: .oil_num)
//        if a == nil {
//            let b = try? container.decode(Double.self, forKey: .oil_num)
//            a = String(b ?? 0)
//        }
//        oil_num = a!
        
        // 方案三：通过【启用】
//        if let a = try? container.decode(String.self, forKey: .oil_num) {
//            oil_num = a
//        } else {
//            oil_num = String((try? container.decode(Double.self, forKey: .oil_num)) ?? 0)
//        }
        
        // 方案四：""字符串不能正确处理【舍弃】
//        oil_num = (try? container.decode(String.self, forKey: .oil_num)) ?? ""
//        if oil_num == "" {
//            oil_num = String((try? container.decode(Double.self, forKey: .oil_num)) ?? 0)
//        }
        
        // 方案五：""字符串不能正确处理【舍弃】
//        oil_num = String((try? container.decode(Double.self, forKey: .oil_num)) ?? 0)
        
        // 方案六：扩展协议，处理 nil 的情况【启用】
        oil_num = container.ds_decode(String.self, forKey: .oil_num, defaultValue: "😁")
//        order_num = try container.decode(Int.self, forKey: .order_num)
        order_num = container.ds_decode(Int.self, forKey: .order_num)
    }
    
}
