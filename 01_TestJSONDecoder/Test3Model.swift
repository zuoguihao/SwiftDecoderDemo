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
    var day: RAReportForm_DayModel?
    /// 当月
    var month: RAReportForm_DayModel?
    /// 上月
    var last_month: RAReportForm_DayModel?
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
        
        // 方法一：
        // 这种方案只能先 try？来匹配 string 类型，如果为 nil，再用 try 来匹配 double 类型；这种方案有缺陷：如果 oil_num 本身为 null，则同样会抛出错误，不能转 model
//        let oilNum: String?
//        if let num = try? container.decode(String.self, forKey: .oil_num) {
//            oilNum = num
//        } else {
//            oilNum = String(try container.decode(Double.self, forKey: .oil_num))
//        }
        
        // 方法二：
        // 用 try? 也可以阻止value 的类型不匹配导致的抛出错误，继续 转 model 下去，可以处理 oil_num 本身为 null 的情况
        oil_num = (try? container.decode(String.self, forKey: .oil_num)) ?? ""
        if oil_num == "" {
            let a = try? container.decode(Double.self, forKey: .oil_num)
            oil_num = String(a ?? 0)
        }
        
        /**
         针对 json 中 oil_num 字段返回类型不唯一的情况，特殊的解决办法：目前来说比较完善的就是方法二来实现，这种情况出现的原因是后台开发人员没有按照文档上的来导致的，前端做到这样已经很好了；
         */
        
        
        order_num = try container.decode(Int.self, forKey: .order_num)
    }
    
}

