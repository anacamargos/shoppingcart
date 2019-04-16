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
    
    @IBAction func placeOrderDidSelect(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of \(totalValueLabel.text!)!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { (action) in
            let sucessActionSheet = UIAlertController(title: "Thank you", message: "Your payment of \(self.totalValueLabel.text!) was processed successfully! Please check your email for your order receipt email and shipping information.", preferredStyle: .actionSheet)
            let continueShoppingAction = UIAlertAction(title: "Let's Shop More!", style: .default, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            })
            
            sucessActionSheet.addAction(continueShoppingAction)
            self.present(sucessActionSheet, animated: true, completion: nil)
        }
        alertController.addAction(cancel)
        alertController.addAction(confirm)
        
        self.present(alertController, animated: true, completion: nil)
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
