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
    let reuseIdentifier = "AddContactTableViewCell"
    let mainSectionArray = ["First Name", "Last Name"]
    let subSectionArray = ["Email", "Phone"]
    var showErrorMessage: ((String) -> Void)?
    var showInfoMessage: ((String) -> Void)?
    
    init(contact: Contact) {
        self.contact = contact
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
                cell.textField.addDoneButtonOnKeyboard()
                cell.textField.tag = 3
            }
        }
        return cell
    }
    
    func validated(_ textFields : [UITextField]) -> Bool {
        var valid: Bool = true
        
        if (textFields[0].text!.isEmpty){
            textFields[0].attributedPlaceholder = NSAttributedString(string: "Please enter first name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            valid = false
        } else {
            contact.firstName = textFields[0].text!
        }
        
        if (textFields[1].text!.isEmpty){
            textFields[1].attributedPlaceholder = NSAttributedString(string:"Please enter last name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            valid = false
        } else {
            contact.lastName = textFields[1].text!
        }
        
        if (!textFields[2].text!.isEmpty) {
            if ((textFields[2].text!.isValidEmail())) {
                contact.email =  textFields[2].text!
            } else {
                showErrorMessage?("Please enter valid email.")
                valid = false
            }
        }
        
        contact.phone = textFields[3].text!
        
        return valid
    }
    
    func getUpdatedContact(_ modelArray : [Contact]) -> [Contact] {
        var tempArray = modelArray
        for (index, element) in modelArray.enumerated() {
            if (self.contact.id ==  element.id) {
                if (element == self.contact) {
                    showErrorMessage?("No changes found.")
                } else {
                    tempArray.remove(at: index)
                    tempArray.insert(contact, at: index)
                }
            }
        }
        return tempArray
    }
}
