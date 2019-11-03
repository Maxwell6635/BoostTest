//
//  ViewController.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var modelArray : [Contact] = []  {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshContactData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Contact Data ...")
        
        fetchContactData()
    }
    
    @objc private func refreshContactData(_ sender: Any) {
        fetchContactData()
    }
    
    private func fetchContactData() {
        let path = Bundle.main.url(forResource: "data", withExtension: "json")!
        
        do{
            let jsonData = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            modelArray = try decoder.decode([Contact].self, from: jsonData)
            print(modelArray)
        } catch let parsingError {
            print("Error", parsingError)
        }
        self.refreshControl.endRefreshing()
    }
    
}

//MARK: -> UITableViewDelegate
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath) as! ContactTableViewCell
        currentCell.viewModel!.tapCell(tableView, indexPath: indexPath, nc: self.navigationController!, modelArray: modelArray)
    }
}

//MARK: -> UITableViewDataSource
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactData = modelArray[indexPath.row]
        let contactViewModel = ContactCellViewModel(contact: contactData)
        return contactViewModel.cellInstance(tableView, indexPath: indexPath)
    }
    
}
