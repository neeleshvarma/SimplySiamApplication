//
//  PaymentViewController.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if isUserLoggedIn == true{
            self.name.text = loggedUserName!
            self.email.text  = loggedUserEmail!
            self.phone.text  = loggedUserPhone
            self.address.text  = loggedUserAddress
            self.city.text  = loggedUserCity
            self.state.text  = loggedUserState
            self.zip.text  = loggedUserZip
            guestUserMessageLBL.text = ""
        } else {
            guestUserMessageLBL.text = "Please fill details to proceed"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var guestUserMessageLBL: UILabel!
    
    @IBAction func ConfirmOrder(_ sender: Any) {
        var status:Bool = false
        var sum:Double = 0.0
        for i in CartItems{
            sum = sum + (i.price * i.quantity)
        }
        var items:String = "<br /><table style='border=1px solid;'><tr><th>Name</th><th>Price x Quantity</th><th>Item Total</th></tr>"
        for i in CartItems{
            items = items + "<tr style='height:40px; width:450px; margin:0;'><td style='border=1px solid;'>\(i.name)</td><td style='border=1px solid;'> \(i.price) x \(i.quantity)  </td><td style='border=1px solid;'>$ \(i.price*i.quantity)</td></tr>"
        }
        
        items = items + "<tr><td><b>Total Price: </b></td><td>\(sum)</td></tr><br /><br />"
        let bodyContent:String = """
<h3>Order Confirmation</h3><br />
        <b>Please find the order details below: </b><br/>
        \(items)
        <h3> No more Waiting </h3><br />
        <b>Thanks</b>
        <p>Simply Siam</p>
"""
        print(bodyContent)
        let alert = UIAlertController(title: "Proceeding to Checkout  Simply Siam", message: "Do you want to confirm your order?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            if databaseManager.sendEmail(subject: "Simply Siam - Order Confirmation", body: bodyContent, recipient: self.email.text!){
                let alertController = UIAlertController(title: "Simply Siam", message:
                    "Order Placed successfully..!!!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }else{
                let alertController = UIAlertController(title: "Simply Siam", message:
                    "Error Placing the order. Please try later..!!!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func BackToHome(_ sender: Any) {
        
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
