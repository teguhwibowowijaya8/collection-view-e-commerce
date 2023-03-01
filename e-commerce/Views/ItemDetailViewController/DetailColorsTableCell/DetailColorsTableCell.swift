//
//  DetailColorsTableCell.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class DetailColorsTableCell: UITableViewCell {
    static let identifier = "DetailColorsTableCell"

    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    var colors: [UIColor]?
    
    func setupCell() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        colorsCollectionView.collectionViewLayout = flowLayout
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
        
        colorsCollectionView.register(UINib(nibName: ItemColorCell.identifier, bundle: nil), forCellWithReuseIdentifier: ItemColorCell.identifier)
    }
}

extension DetailColorsTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let colors = colors else {return 0}
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let colors = colors, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemColorCell.identifier, for: indexPath) as? ItemColorCell else {return UICollectionViewCell()}
        
        cell.setupCell(color: colors[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 18, height: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 15, bottom: 12, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
