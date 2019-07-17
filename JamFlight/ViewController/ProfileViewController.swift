//
//  ProfileViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 12/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var layerBelakang: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        // Do any additional setup after loading the view.
        customImageView(view: profilePicture)
        ColorBackground().gradientBackground(view: view)
        layerBelakang.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    
    
    
    func customImageView(view: UIImageView) {
        view.layer.cornerRadius = view.frame.size.width/2
        
    }
    


}
