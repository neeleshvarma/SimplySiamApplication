//
//  HomeViewController.swift
//  SimplySiamApplication
//
//  Created by student on 2/10/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {

    @IBAction func Logout(_ sender: Any) {
        loggedUserName = ""
        loggedUserEmail = ""
        loggedUserPhone = ""
        loggedUserAddress = ""
        loggedUserCity = ""
        loggedUserState = ""
        loggedUserZip = ""
        isUserLoggedIn = false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
    }
    
    @IBAction func getDirections(_ sender: Any) {
        let latitude: CLLocationDegrees = 40.3484
        let longitude: CLLocationDegrees = -94.8730
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "My House"
        mapItem.openInMaps(launchOptions: options)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
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
