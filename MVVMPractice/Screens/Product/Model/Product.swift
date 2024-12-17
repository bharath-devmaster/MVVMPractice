//
//  Product.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 27/11/24.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title : String
    let price: Float
    let category: String
    let description: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable {
    let rate: Float
    let count: Int
}
