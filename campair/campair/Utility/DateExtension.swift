//
//  DateExtension.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/19.
//

import Foundation

extension Date {
    func getTodayPhase() -> [String] {
        let todayDateFormatter = DateFormatter()
        todayDateFormatter.locale = Locale(identifier: "ko_KR")
        todayDateFormatter.dateFormat = "EEEE a"
        let todayArr = todayDateFormatter.string(from: self).split(separator: " ")
        let today = todayArr[0]
        var arr: [String] = []
        if today == "월요일" || today == "화요일" || today == "수요일" {
            todayDateFormatter.dateFormat = "EEEE이"
            arr.append(todayDateFormatter.string(from: self))
            arr.append("쏘아올린 작은 여행")
        } else {
            arr.append("가볍게 떠나는")
            todayDateFormatter.dateFormat = "EEEE a"
            arr.append(todayDateFormatter.string(from: self))
        }
        return arr
    }
}
