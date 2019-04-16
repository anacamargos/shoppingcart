//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, myDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var productStore: ProductStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabel.text = "$0.0"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.productStore = ProductStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.totalValueLabel.text = "$0.0"
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
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
        
        cell.delegate = self
                
        return cell
    }
    
    func myDelegate(value: Int, productName: String) {
        if let position = productStore.getPositionByName(title: productName) {
            productStore.products[position].setQuantity(quantity: value)
            updateTotalValue()
        }
        
    }
    
    func updateTotalValue() {
        totalValueLabel.text = "$\(productStore.calculateTotal())"
    }
    
    @IBAction func didTapPlaceOrder(_ sender: Any) {
        performSegue(withIdentifier: "finishPurchase", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishPurchase" {
            let checkoutVC = segue.destination as! CheckoutViewController
            checkoutVC.totalValue = self.totalValueLabel.text!
        }
    }
}
