//
//  ViewController.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    private lazy var logoView: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private lazy var logoLabel: UILabel = {
       let logoLabel = UILabel()
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.font = UIFont.boldSystemFont(ofSize: 24)
        logoLabel.text = "LOGO"
        return logoLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavbar()
        setupCollectionView()
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.tintColor = .black
        
        logoView.addSubview(logoLabel)
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 5),
            logoLabel.leftAnchor.constraint(equalTo: logoView.leftAnchor, constant: 0),
            logoLabel.rightAnchor.constraint(equalTo: logoView.rightAnchor, constant: 0),
            logoLabel.bottomAnchor.constraint(equalTo: logoView.bottomAnchor, constant: -5)
        ])
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: logoView), animated: true)
        
        let rightBarImage = UIImage(systemName: "line.3.horizontal")
        let rightBarButton = UIBarButtonItem(image: rightBarImage, style: .plain, target: self, action: #selector(self.rightBarButtonClicked))
        navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    @objc func rightBarButtonClicked() {
        print("Right bar button clicked")
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let availableWidth = itemsCollectionView.bounds.width
        let horizontalPadding: CGFloat = 15
        let verticalPadding: CGFloat = 10
        
        flowLayout.sectionInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        flowLayout.minimumLineSpacing = verticalPadding
        flowLayout.minimumInteritemSpacing = horizontalPadding
        flowLayout.itemSize = CGSize(width: (availableWidth / 2) - (horizontalPadding * 3) / 2, height: 210)
        
        itemsCollectionView.collectionViewLayout = flowLayout
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
        itemsCollectionView.register(UINib(nibName: ItemCardCell.identifier, bundle: nil), forCellWithReuseIdentifier: ItemCardCell.identifier)
        
    }
}

extension ItemListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCardCell.identifier, for: indexPath) as? ItemCardCell else {return UICollectionViewCell()}
        
        cell.item = ItemData.data[indexPath.row]
        cell.setupCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let itemDetailVC = storyboard.instantiateViewController(withIdentifier: ItemDetailViewController.identifier) as? ItemDetailViewController else {return}
        itemDetailVC.item = ItemData.data[indexPath.row]
        
        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
}

