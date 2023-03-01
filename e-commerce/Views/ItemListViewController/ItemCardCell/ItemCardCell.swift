//
//  ItemCardCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class ItemCardCell: UICollectionViewCell {
    
    static let identifier = "ItemCardCell"
    
//    @IBOutlet weak var itemCardView: UIView!
    @IBOutlet weak var itemCardView: CardView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var isLikedButton: UIButton!
    @IBOutlet weak var itemColorsCollectionView: UICollectionView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    var item: ItemModel?
    
    func setupCell() {
        guard let item = item else {return}
        let isLikedImage = UIImage(systemName: item.isLiked ? "heart.fill" : "heart")
        
        itemImageView.image = UIImage(systemName: item.imageName)
        isLikedButton.setImage(isLikedImage, for: .normal)
        itemNameLabel.text = item.name
        itemPriceLabel.text = item.priceString
        
        itemCardView.configure(backgroundColor: .red.withAlphaComponent(0.3))
        
//        itemCardView.cardView(cornerRadius: 10, borderColor: UIColor.black.cgColor, borderWidth: 1)
        
        itemPriceLabel.textColor = UIColor(red: 0.11, green: 0.24, blue: 0.576, alpha: 1)
        
        itemColorsCollectionView.delegate = self
        itemColorsCollectionView.dataSource = self
        itemColorsCollectionView.register(UINib(nibName: ItemColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ItemColorCell.identifier)
    }
}

extension ItemCardCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = item else {return 0}
        return item.availableColors.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = item, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemColorCell.identifier, for: indexPath) as? ItemColorCell else {return UICollectionViewCell()}
        
        if indexPath.row == item.availableColors.count {
            cell.setupCell(isColorCell: false)
        } else {cell.setupCell(color: item.availableColors[indexPath.row])}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 18, height: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
