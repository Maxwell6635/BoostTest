//
//  ContactCellViewModel.swift
//  test
//
//  Created by Jackson Foo Wai Hoong on 01/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import Foundation
import UIKit

class ContactCellViewModel {
    let contact : Contact
    let name: String
    let reuseIdentifier = "ContactTableViewCell"
    
    init(contact: Contact) {
        self.contact = contact
        name = ("\(contact.firstName) \(contact.lastName)")
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for : indexPath) as! ContactTableViewCell
        cell.configure(self)
        return cell
    }
}
