//
//  DetailDescriptionTableCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class DetailDescriptionTableCell: UITableViewCell {
    static let identifier = "DetailDescriptionTableCell"

    @IBOutlet weak var descriptionTextView: UITextView!
    
    func setupCell(description: String) {
        descriptionTextView.text = description
    }
    
}
