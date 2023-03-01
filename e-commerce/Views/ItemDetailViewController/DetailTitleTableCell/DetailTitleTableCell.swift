//
//  DetailTitleTableCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class DetailTitleTableCell: UITableViewCell {
    static let identifier = "DetailTitleTableCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupCell(title: String){
        titleLabel.text = title
        titleLabel.numberOfLines = 0
    }
    
}
