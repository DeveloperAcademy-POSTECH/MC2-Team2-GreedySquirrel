//
//  ViewExtension.swift
//  campair
//
//  Created by 이가은 on 2022/06/16.
//

import SwiftUI

extension View {
    func bodyDefaultDarkGray() -> some View {
        self
            .foregroundColor(Color.customDarkGray)
            .font(.system(.body, design: .default))
            .lineSpacing(5.0)
    }
    func headlineDefaultBlack() -> some View {
        self
            .foregroundColor(Color.customBlack)
            .font(.system(.headline, design: .default))
    }
    func caption1DefaultDarkGray() -> some View {
        self
            .foregroundColor(Color.customDarkGray)
            .font(.system(.caption, design: .default))
    }
    func bodyBold000000Opacity60() -> some View {
        self
            .foregroundColor(Color(hex: "000000"))
            .opacity(0.6)
            .font(.system(.body))
    }
}
