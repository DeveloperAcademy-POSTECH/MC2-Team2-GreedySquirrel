//
//  SafeAreaPadding.swift
//  campair
//
//  Created by 이가은 on 2022/06/14.
//

import Foundation
import SwiftUI

extension UIDevice {
    /// Returns safeArea top value
    var getSafeAreaTopValue: CGFloat {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
        else { return 0 }
        return window.safeAreaInsets.top
    }
}
