//
//  ArbuzModel.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 29.05.2022.
//

import Foundation

enum ArbuzStatus: Equatable {
    case ripe
    case unripe
    case alreadyTaken
}
struct ArbuzModel: Equatable {
    let id: Int
    let weight: Double
    let status: ArbuzStatus
    var isSelected: Bool = false
}
