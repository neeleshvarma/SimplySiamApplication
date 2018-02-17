//
//  Users.swift
//  SimplySiamApplication
//
//  Created by student on 2/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

@objcMembers
class Users : NSObject {
    var objectId:String? // optional, if we need access to this
    var name:String?
    var email:String?
    var address:String?
    var state:String?
    var city:String?
    var zip:String?
    var phone:String?
    
    
    override var description: String {
        return "name: \(String(describing:name))"
    }
    
    
    init(name:String,email:String,address:String,state:String,city:String,zip:String,phone:String){
        self.name = name
        self.email = email
        self.address = address
        self.state = state
        self.city = city
        self.zip = zip
        self.phone = phone
    }
    
    override init() {
        super.init()
    }
}
