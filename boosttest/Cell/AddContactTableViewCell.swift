//
//  AddContactTableViewCell.swift
//  test
//
//  Created by Jackson Foo Wai Hoong on 02/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import UIKit

class AddContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
