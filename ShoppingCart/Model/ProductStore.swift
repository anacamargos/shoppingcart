//
//  ProductStore.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

struct Product {
    var title: String
    var price: Double
    var image: UIImage
}

class ProductStore {
    
    var products: [Product] = [
        Product(title: "iPad Pro", price: 599, image: #imageLiteral(resourceName: "img_ipad") ),
        Product(title: "Apple Watch", price: 299, image: #imageLiteral(resourceName: "img_watch") ),
        Product(title: "Apple TV", price: 199, image: #imageLiteral(resourceName: "img_tv") )
    ]
    
    func getPriceByName(title: String) -> Double? {
        for product in products {
            if product.title == title {
                return product.price
            }
        }
        return nil
    }
}
