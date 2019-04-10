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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        cell.productImageView.image = UIImage(named: "img_ipad")
        cell.productImageView.backgroundColor = UIColor.red

        return cell
    }

}
