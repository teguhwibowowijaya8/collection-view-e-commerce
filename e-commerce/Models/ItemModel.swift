//
//  ItemModel.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

struct ItemModel {
    let name: String
    let availableColors: [UIColor]
    let imageName: String
    let price: Int
    let isLiked: Bool
    let description: String
    
    var priceString: String {
        return String(format: "$%d", locale: .autoupdatingCurrent, price)
    }
}
