//
//  LoginViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 16/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var safeAreaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        ColorBackground().gradientBackground(view: view)
    }
    
    
    func setupView(){
        safeAreaView.backgroundColor = .clear
        
        usernameTextField.layer.cornerRadius = 20.0
        usernameTextField.layer.borderWidth = 2.0
        usernameTextField.backgroundColor = .white
        usernameTextField.addPadding(.left(15))
        
        
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.layer.borderWidth = 2.0
        emailTextField.backgroundColor = .white
        emailTextField.addPadding(.left(15))

        
        //LABEL
        titleLabel.text = "Let's help Jam Battle get to know you \n better."
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        //BUTTON
        submitBtn.backgroundColor = .goldTheme
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.titleLabel?.numberOfLines = 1
        submitBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        submitBtn.layer.cornerRadius = 15
        
        
        
    }
    


}

extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
