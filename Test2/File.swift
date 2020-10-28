//
//  File.swift
//  Test2
//
//  Created by Mac on 21.10.2020.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let greeting: String
    let instructions: [Instruction]
}

// MARK: - Instruction
struct Instruction: Codable {
    let id, name: String
    let price: Double
    let currency: String
    let imageURL: String
    let stock: Int

    enum CodingKeys: String, CodingKey {
        case id, name, price, currency
        case imageURL = "imageUrl"
        case stock
    }
}
