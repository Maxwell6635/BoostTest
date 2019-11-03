//
//  AddContactViewController.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var contact : Contact?
    var modelArray : [Contact]?
    var textFields : [UITextField] = []
    var addContactViewModel : AddContactCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularView.makeCirclularView()
        if (contact == nil) {
            contact = Contact.init(id: UUID().uuidString, firstName: "", lastName: "", email: "", phone: "")
        }
        addContactViewModel = AddContactCellViewModel(contact: contact!)
        setupBinding()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        dimissController()
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if ((addContactViewModel?.validated(textFields))!) {
            modelArray!.append(addContactViewModel!.contact)
            writeToFile()
        }
    }
    
    func setupBinding() {
        
        tableView.register(UINib(nibName: "AddContactTableViewCell", bundle: nil), forCellReuseIdentifier: "AddContactTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        addContactViewModel?.showInfoMessage = { [weak self] message in
            self?.showInfoMessage(message)
        }
        
        addContactViewModel?.showErrorMessage = { [weak self] message in
            self?.showErrorMessage(message)
        }
    }
    
    func dimissController() {
        navigationController?.popViewController(animated: true)
    }
    
    func writeToFile() {
        let path = Bundle.main.url(forResource: "data", withExtension: "json")!
        print(path)
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(modelArray)
            try JsonData.write(to: path)
            navigationController?.popViewController(animated: true)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
}

//MARK: -> UITableViewDataSource
extension AddContactViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = NSLocalizedString("Main Information", comment: "main")
        case 1:
            sectionName = NSLocalizedString("Sub Information", comment: "sub")
        default:
            sectionName = ""
        }
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addContactViewModel!.cellInstance(tableView, indexPath: indexPath, delegate: self) as! AddContactTableViewCell
        textFields.append(cell.textField)
        return cell
    }
}

//MARK: -> UITableViewDelegate
extension AddContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: -> UITextFieldDelegate
extension AddContactViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.tag == 3) {
            textField.returnKeyType = UIReturnKeyType.done
        } else {
            textField.returnKeyType = UIReturnKeyType.next
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFields[textField.tag + 1].becomeFirstResponder()
        return false
    }
}
