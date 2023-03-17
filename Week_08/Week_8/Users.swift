//
//  Users.swift
//  Week_8
//
//  Created by labuser on 30/12/2022.
//

import UIKit

class Users: NSObject {
    var name : String
    var age : Int
    var email : String
    
    init(name: String, age: Int, email: String) {
        self.name = name
        self.age = age
        self.email = email
    }
}
