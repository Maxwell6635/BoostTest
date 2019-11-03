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
