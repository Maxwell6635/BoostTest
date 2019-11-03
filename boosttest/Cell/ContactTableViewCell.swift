//
//  ContactTableViewCell.swift
//  test
//
//  Created by Jackson Foo Wai Hoong on 01/11/2019.
//  Copyright © 2019 Jackson Foo Wai Hoong. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var circularView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel : ContactCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circularView.layer.cornerRadius = circularView.frame.size.width / 2.0
        circularView.clipsToBounds = true
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(_ viewModel: ContactCellViewModel) {
        self.viewModel = viewModel
        nameLabel!.text = viewModel.name
    }
}
