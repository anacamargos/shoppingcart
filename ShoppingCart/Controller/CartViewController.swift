//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var productStore: ProductStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.productStore = ProductStore()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        //cell.productImageView.image = UIImage(named: "img_ipad")
        cell.productImageView.backgroundColor = UIColor.red
        
        switch indexPath.row {
        case 0:
            cell.configure(currentProduct: productStore.products[0])
        case 1:
            cell.configure(currentProduct: productStore.products[1])
        case 2:
            cell.configure(currentProduct: productStore.products[2])
        default:
            cell.configure(currentProduct: productStore.products[0])
        }

        return cell
    }

}
