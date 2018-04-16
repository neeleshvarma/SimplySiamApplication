//
//  FeedbackViewController.swift
//  SimplySiamApplication
//
//  Created by Lohita Reddy Vanga on 4/4/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UIScrollView!
    @IBOutlet weak var content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitFeedback(_ sender: Any) {
        var sub = "Feedback from -" + "\(name.text!)"
        var bodyData = "<b>Feedback: </b>" + "\(content.text!)"
        var recipientData = "simplysiamios@gmail.com"
        
        let alert = UIAlertController(title: "Feedback", message: "Do you want to send Feedback ?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            if databaseManager.sendEmail(subject: sub, body: bodyData, recipient: recipientData)
            {
                print("Feedback Sent")
                if((self.presentingViewController) != nil){
                    self.dismiss(animated: false, completion: nil)
                    print("sent successfully")
                }
            }else{
                print("Failed to send feedback")
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        }
    
    @IBAction func Cancel(_ sender: Any) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
            print("cancel")
        }
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
