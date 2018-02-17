//
//  ProfileViewController.swift
//  SimplySiamApplication
//
//  Created by student on 2/10/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBAction func Update(_ sender: Any) {
        
    }
    
    @IBAction func ChangePassword(_ sender: Any) {
        var status:Bool = false
        let alert = UIAlertController(title: "Password Recovery", message: "You will get a link to registered mail to reset your password. Do you want to continue?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            databaseManager.resetPassword(username: loggedUserEmail)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
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
        }
        // Do any additional setup after loading the view.
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
