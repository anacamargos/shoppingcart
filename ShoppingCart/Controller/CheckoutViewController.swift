//
//  CheckoutViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 12/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var totalValueLabel: UILabel!
    
    var totalValue : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabel.text = "\(totalValue)"

    }
    
}
