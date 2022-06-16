//
//  Equipment.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Foundation

struct Equipment: Codable {
    let paintingURL: String
    let title: String
    let content: String
    let pros: [String]
    let cons: [String]
}
