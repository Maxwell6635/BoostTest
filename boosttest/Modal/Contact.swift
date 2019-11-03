//
//  Contact.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import Foundation

struct Contact : Codable {
    var id : String
    var firstName : String
    var lastName : String
    var email : String?
    var phone : String?
}
