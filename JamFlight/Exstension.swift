//
//  Exstensiom.swift
//  4Play
//
//  Created by iSal on 09/07/19.
//  Copyright © 2019 iSal. All rights reserved.
//

import UIKit

extension UIViewController {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 11/255.0, green: 56/255.0, blue: 75/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor.black.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

extension UIButton {
    func circle(){
        self.layer.cornerRadius = 19
    }
    
    func primaryButton() {
        self.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        self.tintColor = .white
        self.setTitleColor(#colorLiteral(red: 1, green: 0.7966855764, blue: 0.1883786321, alpha: 1), for: .highlighted)
        self.titleLabel?.font =  UIFont.systemFont(ofSize: 15, weight: .bold)
        self.heightAnchor.constraint(equalToConstant: 38).isActive = true
        self.widthAnchor.constraint(equalToConstant: 223).isActive = true
    }
    
    func secondaryButton() {
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.tintColor = .white
        self.setTitleColor(#colorLiteral(red: 1, green: 0.7966855764, blue: 0.1883786321, alpha: 1), for: .highlighted)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215686, green: 0.631372549, blue: 0.1490196078, alpha: 1)
        self.titleLabel?.font =  UIFont.systemFont(ofSize: 15, weight: .light)
        self.heightAnchor.constraint(equalToConstant: 38).isActive = true
        self.widthAnchor.constraint(equalToConstant: 223).isActive = true
    }
}

extension UILabel {
    func titleStyle(){
        self.textColor = #colorLiteral(red: 0.8784313725, green: 0.7921568627, blue: 0.5568627451, alpha: 1)
        self.font = UIFont.systemFont(ofSize: 36, weight: .bold)
    }
    
    func titleBody(){
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
}

extension UIScrollView {
    func getPageIndex() -> Int{
        return Int(self.contentOffset.x / self.frame.size.width)
    }
}
