//
//  AddContactCellViewModel.swift
//  test
//
//  Created by Jackson Foo Wai Hoong on 02/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import Foundation
import UIKit

class AddContactCellViewModel {
    var contact : Contact
    let name: String
    let reuseIdentifier = "AddContactTableViewCell"
    let mainSectionArray = ["First Name", "Last Name"]
    let subSectionArray = ["Email", "Phone"]
    
    init(contact: Contact) {
        self.contact = contact
        name = ("\(contact.firstName) \(contact.lastName)")
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath, delegate : UITextFieldDelegate) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for : indexPath) as! AddContactTableViewCell
        cell.textField.delegate = delegate
        cell.selectionStyle = .none
        if indexPath.section == 0 {
            cell.titleLabel.text = mainSectionArray[indexPath.row]
            if (indexPath.row == 0) {
                cell.textField.text = contact.firstName
                cell.textField.keyboardType = .alphabet
                cell.textField.tag = 0
            } else {
                cell.textField.text = contact.lastName
                cell.textField.keyboardType = .alphabet
                cell.textField.tag = 1
            }
        } else {
            cell.titleLabel.text = subSectionArray[indexPath.row]
            if (indexPath.row == 0) {
                cell.textField.text = contact.email
                cell.textField.keyboardType = .emailAddress
                cell.textField.tag = 2
            } else {
                cell.textField.text = contact.phone
                cell.textField.keyboardType = .phonePad
                cell.textField.tag = 3
            }
        }
        return cell
    }
}
