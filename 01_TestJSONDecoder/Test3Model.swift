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
    let month0: RAReportForm_DayModel
    let month1: RAReportForm_DayModel
    let month2: RAReportForm_DayModel
    let month3: RAReportForm_DayModel
    let month4: RAReportForm_DayModel
    let month5: RAReportForm_DayModel
    let month6: RAReportForm_DayModel?
    let month7: RAReportForm_DayModel
}

struct RAReportForm_DayModel: Decodable {
    /// 当天/当月/上月服务的总笔数
    var order_num: Int
    /// 当天/当月/上月服务的总升数
    let oil_num: String?
}
