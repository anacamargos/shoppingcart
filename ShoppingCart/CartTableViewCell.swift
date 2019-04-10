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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
