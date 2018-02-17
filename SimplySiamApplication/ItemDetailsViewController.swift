//
//  ItemDetailsViewController.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    var item:MenuItem?
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UITextView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    @IBAction func stepperValue(_ sender: UIStepper) {
        quantity.text = "\(sender.value)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.text = item?.name
        itemDescription.text = item?.itemDescription
        itemImage.image = item?.image
        price.text = "$" + "\(item?.price ?? 0.0)"
        self.navigationItem.setHidesBackButton(false, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddToCart(_ sender: Any) {
        let n = (item?.name)!
        let q = Double(quantity.text!)
        let p = Double((item?.price)!)
        let cartElement = CartItem(name: n, quantity: q!, price: p)
        CartItems.append(cartElement)
        print(CartItems)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
