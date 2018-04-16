//
//  LoginViewController.swift
//  SimplySiamApplication
//
//  Created by student on 1/31/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    
    @IBAction func ForgotPassword(_ sender: Any) {
        print("forgot password")
        let alert = UIAlertController(title: "Simply Siam Password Recovery", message: "Mail will be sent to \(self.username.text!) with steps to recover password?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            if databaseManager.resetPassword(username: self.username.text!){
                let alertController = UIAlertController(title: "Simply Siam", message:
                    "Reset password mail sent successfully..!!!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }else{
                let alertController = UIAlertController(title: "Simply Siam", message:
                    "Reset password mail sent successfully..!!!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    @IBAction func LoginUserBtn(_ sender: Any) {
        var status:Bool = databaseManager.loginUser(username: username.text!, password: password.text!)
        if status == true && isUserLoggedIn == true{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuItemTabbarVC = storyboard.instantiateViewController(withIdentifier: "menuItemTabbarVC") as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = menuItemTabbarVC
        } else {
            let alertController = UIAlertController(title: "Simply Siam", message:
                "User Login Failed..!!!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func ContinueAsGuest(_ sender: Any) {
        print("guest")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuItemTabbarVC = storyboard.instantiateViewController(withIdentifier: "menuItemTabbarVC") as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = menuItemTabbarVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.username.delegate = self
        self.password.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
