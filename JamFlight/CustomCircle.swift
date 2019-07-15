//
//  CustomCircle.swift
//  JamFlight
//
//  Created by Alan Santoso on 12/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class CustomCircle: UIView {

    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 0.5)
        self.layer.cornerRadius = self.frame.size.width/2
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }

}
