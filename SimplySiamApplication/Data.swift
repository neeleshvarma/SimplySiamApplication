//
//  Data.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class MenuItem:Equatable,CustomStringConvertible{
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return true
    }
    
    var description:String{
        return ""
    }
    
    var name:String?
    var itemDescription: String?
    var price: Double?
    var image:UIImage?
    
    init(name:String, itemDescription:String, price:Double, image:UIImage){
        self.name = name
        self.itemDescription = itemDescription
        self.price = price
        self.image = image
    }
}

var item1 = MenuItem(name:"chicken salad1", itemDescription:"Combination of all green vegetables with added chicken with pepper", price: 0.0 , image: #imageLiteral(resourceName: "item1") )
var item2 = MenuItem(name:"chicken salad2", itemDescription:"Combination of all green vegetables with added chicken with pepper", price: 2.15 , image: #imageLiteral(resourceName: "item2") )
var item3 = MenuItem(name:"chicken salad3", itemDescription:"Combination of all green vegetables with added chicken with pepper", price: 4.3 , image: #imageLiteral(resourceName: "item3") )
var item4 = MenuItem(name:"chicken salad4", itemDescription:"Combination of all green vegetables with added chicken with pepper", price: 10 , image: #imageLiteral(resourceName: "item4") )
var item5 = MenuItem(name:"chicken salad5", itemDescription:"Combination of all green vegetables with added chicken with pepper", price: 20.0 , image: #imageLiteral(resourceName: "item5") )

struct Menu{
    static var MenuItems:[MenuItem] = [item1,item2,item3,item4,item5]
}

class CartItem{
    var name:String
    var quantity: Double
    var price: Double
    
    init(name: String, quantity:Double, price:Double){
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

var cart1 = CartItem(name: "a", quantity: 1, price: 1)
var cart2 = CartItem(name: "b", quantity: 1, price: 1)
var cart3 = CartItem(name: "c", quantity: 1, price: 1)

var CartItems:[CartItem] = []
