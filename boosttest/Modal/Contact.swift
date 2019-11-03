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
//    
//    init(id : String, firstName : String, lastName : String, email : String, phone : String ) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//        self.phone = phone
//    }
}


extension Contact: Equatable {
    var diffIdentifier: String {
        return id
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id &&
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.email == rhs.email &&
            lhs.phone == rhs.phone
    }
}
