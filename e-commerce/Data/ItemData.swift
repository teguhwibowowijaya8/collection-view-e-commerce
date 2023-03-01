//
//  ItemData.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import Foundation

struct ItemData {
    static let data: [ItemModel] = [
        ItemModel(name: "Adidas Adidas Adidas Adidas Adidas", availableColors: [.green, .gray], imageName: "shoeprints.fill", price: 50, isLiked: false, description: description),
        ItemModel(name: "Nike", availableColors: [.red, .gray], imageName: "shoeprints.fill", price: 70, isLiked: false, description: description),
        ItemModel(name: "Bata", availableColors: [.green, .blue], imageName: "shoeprints.fill", price: 90, isLiked: false, description: description),
        ItemModel(name: "Sepatu", availableColors: [.green, .gray, .blue], imageName: "shoeprints.fill", price: 150, isLiked: false, description: description),
        ItemModel(name: "Lain", availableColors: [.green, .gray, .orange], imageName: "shoeprints.fill", price: 20, isLiked: false, description: description),
    ]
    
    private static let description = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
}
