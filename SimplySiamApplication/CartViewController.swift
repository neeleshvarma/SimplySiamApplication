//
//  CartViewController.swift
//  SimplySiamApplication
//
//  Created by student on 2/10/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var totalPrice: UILabel!
    
    @IBAction func ProceedToCheckout(_ sender: Any) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        var sum:Double = 0.0
        for i in CartItems{
            sum = sum + (i.price * i.quantity)
        }
        totalPrice.text = "\(sum)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
