//
//  CardView.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 28/02/23.
//

import UIKit

extension UIView {
    func cardView(cornerRadius: CGFloat, borderColor: CGColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.clipsToBounds = true
    }
}

class CardView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
//    override class func userInterfaceLayoutDirection(for attribute: UISemanticContentAttribute) -> UIUserInterfaceLayoutDirection {
//        super.userInterfaceLayoutDirection(for: attribute)
//        return UIUserInterfaceLayoutDirection.rightToLeft
//    }
    
    func configure(
        cornerRadius: CGFloat = 10,
        borderColor: CGColor = UIColor.black.cgColor,
        borderWidth: CGFloat = 1,
        backgroundColor: UIColor = .white
    ) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
    }
}

//class CardView: UIView {
//    private var cornerRadius: CGFloat = 10
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        configure()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
//
//    func configure() {
//        self.layer.cornerRadius = self.cornerRadius
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.black.cgColor
//        self.clipsToBounds = true
//        self.backgroundColor = .black
//    }
//}
