//
//  Contact.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import Foundation

struct Contact : Codable {
    let id : String
    let firstName : String
    let lastName : String
    let email : String?
    let phone : String?
}
