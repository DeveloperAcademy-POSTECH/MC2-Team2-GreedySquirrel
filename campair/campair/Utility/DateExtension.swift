//
//  DateExtension.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/19.
//

import Foundation

extension Date {
    func getTodayPhase() -> String {
        let todayDateFormatter = DateFormatter()
        todayDateFormatter.locale = Locale(identifier: "ko_KR")
        todayDateFormatter.dateFormat = "EEEE a"
        return todayDateFormatter.string(from: self)
    }
}
