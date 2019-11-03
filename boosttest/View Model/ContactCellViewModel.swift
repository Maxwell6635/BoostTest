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
    
    func tapCell(_ tableView: UITableView, indexPath: IndexPath, nc : UINavigationController, modelArray : [Contact]) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        vc.contact = contact
        vc.modelArray = modelArray
        nc.pushViewController(vc, animated: true)
    }
}
