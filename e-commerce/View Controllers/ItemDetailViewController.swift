//
//  ItemDetailViewController.swift
//  e-commerce
//
//  Created by Teguh Wibowo Wijaya on 27/02/23.
//

import UIKit

enum ItemDetailSection: Int {
    case title
    case image
    case colors
    case description
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .title
        case 1:
            self = .image
        case 2:
            self = .colors
        case 3:
            self = .description
        default:
            self = .title
        }
    }
}

class ItemDetailViewController: UIViewController {
    
    static let identifier = "ItemDetailViewController"
    
    @IBOutlet weak var itemDetailTableView: UITableView!
    
    var item: ItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        itemDetailTableView.delegate = self
        itemDetailTableView.dataSource = self
        itemDetailTableView.separatorStyle = .none
        
        itemDetailTableView.register(UINib(nibName: DetailTitleTableCell.identifier, bundle: nil), forCellReuseIdentifier: DetailTitleTableCell.identifier)
        itemDetailTableView.register(UINib(nibName: DetailImageTableCell.identifier, bundle: nil), forCellReuseIdentifier: DetailImageTableCell.identifier)
        itemDetailTableView.register(UINib(nibName: DetailColorsTableCell.identifier, bundle: nil), forCellReuseIdentifier: DetailColorsTableCell.identifier)
        itemDetailTableView.register(UINib(nibName: DetailDescriptionTableCell.identifier, bundle: nil), forCellReuseIdentifier: DetailDescriptionTableCell.identifier)
    }
}

extension ItemDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = item else {return UITableViewCell()}
        
        switch ItemDetailSection(indexPath.section) {
        case .title:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleTableCell.identifier, for: indexPath) as? DetailTitleTableCell else {return UITableViewCell()}
            
            cell.setupCell(title: item.name)
            
            return cell
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageTableCell.identifier, for: indexPath) as? DetailImageTableCell else {return UITableViewCell()}
            
            cell.setupCell(imageName: "heart")
            
            return cell
        case .colors:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailColorsTableCell.identifier, for: indexPath) as? DetailColorsTableCell else {return UITableViewCell()}
            
            cell.colors = item.availableColors
            cell.setupCell()
            
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionTableCell.identifier, for: indexPath) as? DetailDescriptionTableCell else {return UITableViewCell()}
            
            cell.setupCell(description: item.description)
            
            return cell
        }
    }
    
    
}
