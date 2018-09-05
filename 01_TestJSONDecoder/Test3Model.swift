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
    let day: RAReportForm_DayModel
    /// 当月
    let month: RAReportForm_DayModel
    /// 上月
    let last_month: RAReportForm_DayModel
    let last_month2: RAReportForm_DayModel
    let year: RAReportForm_DayModel
    let last_year: RAReportForm_DayModel
}

struct RAReportForm_DayModel: Decodable {
    /// 当天/当月/上月服务的总笔数
    var order_num: Int
    /// 当天/当月/上月服务的总升数
    let oil_num: String?
        
}
