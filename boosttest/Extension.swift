//
//  Extension.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func makeCirclularView() {
        layer.cornerRadius = frame.size.width / 2.0
        clipsToBounds = true
    }
}

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension UIViewController {
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel) { (action) in
        }
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorMessage(_ message: String, completion: @escaping (() -> Void)) {
        let alertController = UIAlertController(title: nil, message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel) { (action) in
            completion()
        }
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showInfoMessage(_ message: String) {
        let alertController = UIAlertController(title: nil, message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel) { (action) in
        }
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
