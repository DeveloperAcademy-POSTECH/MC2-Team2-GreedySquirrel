//
//  EquipmentGroup.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import Foundation

enum Category: Int, Codable {
    case tent
    case tarp
    case campingSheet
    case multiTool
    case pole
    case campingTable
    case campingChair
    case hammock
    case sleepingBag
    case cutlery
    case mat
    case campingBox
    case campingLight
    case campingTool
    case emergencyKit
    case toilet
    var korean: String {
        switch self {
        case .tent: return "텐트"
        case .tarp: return "타프"
        case .campingSheet: return "시트"
        case .multiTool: return "부품"
        case .pole: return "폴대"
        case .campingTable: return "테이블"
        case .campingChair: return "의자"
        case .hammock: return "해먹"
        case .sleepingBag: return "침낭"
        case .cutlery: return "식기"
        case .mat: return "매트"
        case .campingBox: return "수납"
        case .campingLight: return "조명"
        case .campingTool: return "캠핑공구"
        case .emergencyKit: return "응급/안전"
        case .toilet: return "위생"
        }
    }
}

struct EquipmentGroup: Codable {
    let name: String
    let equipments: [Equipment]
}
