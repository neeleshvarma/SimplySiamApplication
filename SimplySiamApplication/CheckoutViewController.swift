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
        let alert = UIAlertController(title: "Proceeding to Checkout  Simply Siam", message: "Do you want to confirm your order?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            if databaseManager.sendEmail(subject: "Simply Siam - Order Confirmation", body: "This is from simply siam order confirmation.", recipient: self.email.text!){
            print("Order Confirmed")
            }else{
                print("Order Confirmed")
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
