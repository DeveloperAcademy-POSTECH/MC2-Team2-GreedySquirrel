//
//  ColorExtension.swift
//  campair
//
//  Created by 이가은 on 2022/06/14.
//

import SwiftUI

extension Color {
    static let customBackGroundColor = Color(#colorLiteral(red: 0.9222490191, green: 0.8728070259, blue: 0.8261210322, alpha: 1))
    static let customDarkGray = Color(#colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.6))
    static let customBlack = Color(#colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1))
    static let customLightGray = Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1))
    static let customCardGray = Color(#colorLiteral(red: 0.9559776187, green: 0.9609488845, blue: 0.956553638, alpha: 1))
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var opacity: CGFloat = 1.0
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        if length == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            opacity = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
