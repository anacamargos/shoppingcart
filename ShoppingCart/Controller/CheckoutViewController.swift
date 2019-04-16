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
    @IBOutlet weak var expressButton: UIButton!
    @IBOutlet weak var standardButton: UIButton!
    
    var totalValue : String = ""
    var originalTotalValue: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabel.text = "\(totalValue)"
        let valueInDouble = Double(totalValue.substring(with: 1..<totalValue.count))
        originalTotalValue = valueInDouble!
        
        standardButton.isEnabled = false

    }
    
    @IBAction func expressSelection(_ sender: Any) {
        standardButton.isEnabled = true
        expressButton.isEnabled = false
        
        let valueInDouble = Double(totalValue.substring(with: 1..<totalValue.count))
        self.totalValueLabel.text = "$\(valueInDouble! + 15)"
    }
    
    @IBAction func standardSelection(_ sender: Any) {
        standardButton.isEnabled = false
        expressButton.isEnabled = true
        
        self.totalValueLabel.text = "$\(originalTotalValue)"
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
