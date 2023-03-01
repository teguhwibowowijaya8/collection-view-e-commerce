//
//  ItemColorCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class ItemColorCell: UICollectionViewCell {
    static let identifier = "ItemColorCell"
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var plusButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(isColorCell: Bool = true, color: UIColor = .white) {
        if isColorCell {
            plusButton.isHidden = true
            colorView.backgroundColor = color
            colorView.layer.cornerRadius = 5
            colorView.layer.borderWidth = 0.5
            colorView.layer.borderColor = UIColor.black.cgColor
        } else {
            plusButton.isHidden = false
            colorView.backgroundColor = .white
        }
    }

}
