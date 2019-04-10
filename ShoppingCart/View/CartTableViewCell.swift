//
//  CartTableViewCell.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.productQuantityLabel.text = "0"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure (currentProduct: Product) {
        self.productTitleLabel.text = currentProduct.title
        self.productPriceLabel.text = "\(currentProduct.price)"
        self.productImageView.image = currentProduct.image
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.productQuantityLabel.text = Int(sender.value).description
    }
    
}
