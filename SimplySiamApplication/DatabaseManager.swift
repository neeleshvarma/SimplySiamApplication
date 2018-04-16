//
//  DatabaseManager.swift
//  SimplySiamApplication
//
//  Created by student on 2/3/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import UIKit

let databaseManager:DatabaseManager = DatabaseManager()
var loggedUserName:String? = ""
var loggedUserEmail:String? = ""
var loggedUserPhone:String = ""
var loggedUserAddress:String = ""
var loggedUserCity:String = ""
var loggedUserState:String = ""
var loggedUserZip:String = ""
var isUserLoggedIn:Bool = false

class DatabaseManager {
    
    let APPLICATION_ID = "D4919F72-D08F-1E98-FF69-3F0683065600"
    let API_KEY = "1BC4B747-252E-57C9-FF4C-66C5447FC800"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreUser:IDataStore!
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        dataStoreUser = backendless.data.of(Users.ofClass())
    }

    
    func loginUser (username:String,password:String)->Bool {
        var flag:Bool = false
        Types.tryblock({ () -> Void in
            let user = self.backendless.userService.login(username, password: password)
            print("User has been logged in: \(user?.name as! String)")
            loggedUserName = user?.name as! String
            loggedUserEmail = user?.email as! String
            loggedUserPhone = user?.getProperty("phone") as! String
            loggedUserAddress = user?.getProperty("address") as! String
            loggedUserCity = user?.getProperty("city") as! String
            loggedUserState = user?.getProperty("state") as! String
            loggedUserZip = user?.getProperty("zip") as! String
            isUserLoggedIn = true
            flag = true
        },
            catchblock: { (exception) -> Void in
            print("Server reported an error: \(exception as! Fault)")
        })
        return flag
    }
    
    func registerUser(name:String, email:String, passs:String, phone:String, address:String, city:String, state:String, zip:String)->Bool {
        var flag:Bool = false
        Types.tryblock({() -> Void in
            var user = BackendlessUser()
            user.email = email as NSString
            user.password = passs as NSString
            user.name = name as NSString
            user.setProperty("phone", object:phone as NSString)
            user.setProperty("address", object:address as NSString)
            user.setProperty("city", object:city as NSString)
            user.setProperty("state", object:state as NSString)
            user.setProperty("zip", object:zip as NSString)
            
            var registeredUser = self.backendless.userService.register(user)
            flag = true
            print("User has been registered (SYNC): \(registeredUser)")}
            ,
            catchblock: {(exception) -> Void in
            print("Server reported an error: \(exception as! Fault)")})
            return flag
    }
    
    func logout() -> Bool {
        var flag:Bool = false
        backendless.userService.logout({
            (result : Any?) -> Void in
            print("User has been logged out")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = loginVC
            flag = true
        },
            error: {
            (fault : Fault?) -> Void in
            print("Server reported an error: \(fault?.description)")
        })
        return flag
    }
    
    func sendEmail(subject:String,body:String,recipient:String)->Bool{
        var flag:Bool = false
        Types.tryblock({ () -> Void in
            let subject = subject
            let body = body
            let recipient = recipient
            self.backendless.messagingService.sendHTMLEmail(subject, body:body, to:[recipient])
            print("HTML email has been sent")
            flag = true
        },
            catchblock: { (exception) -> Void in
            print("Server reported an error: \(exception as! Fault)")
            }
        )
        return flag
    }
    
    func resetPassword(username:String?) -> Bool {
        var flag:Bool = false
        backendless.userService.restorePassword(username,
            response: {
            (result : Any) -> Void in
            print("Please check your email inbox to reset your password")
            flag = true
        },
            error: {
            (fault : Fault?) -> Void in
            print("Server reported an error: \(fault?.description)")
        })
        return flag
    }
}
