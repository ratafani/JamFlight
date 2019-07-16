//
//  CustomColor.swift
//  JamFlight
//
//  Created by Muhammad Tafani Rabbani on 10/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(hex: 0x0B384B).cgColor
        let colorBottom = UIColor(hex: 0x000000).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 0.75]
    }
    
    
}

class ColorBackground{
    func gradientBackground( view : UIView){
        view.backgroundColor = .clear
        let backgroundLayer = Colors().gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
}
extension UIColor {
    convenience init(hex: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green:CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha:  CGFloat(255 * alpha) / 255)
    }
    
    static let goldTheme = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)

}
