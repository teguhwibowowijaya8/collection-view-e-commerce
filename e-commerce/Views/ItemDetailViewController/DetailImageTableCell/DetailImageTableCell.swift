//
//  DetailImageTableCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class DetailImageTableCell: UITableViewCell {
    static let identifier = "DetailImageTableCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    func setupCell(imageName: String) {
        itemImageView.image = UIImage(systemName: imageName)
        itemImageView.backgroundColor = .gray.withAlphaComponent(0.3)
    }
    
}
