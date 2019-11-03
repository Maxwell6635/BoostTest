//
//  ViewController.swift
//  boosttest
//
//  Created by Jackson Foo Wai Hoong on 03/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var modelArray : [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

      }

}

