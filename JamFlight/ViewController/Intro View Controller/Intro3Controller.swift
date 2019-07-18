//
//  Intro3Controller.swift
//  4Play
//
//  Created by iSal on 09/07/19.
//  Copyright © 2019 iSal. All rights reserved.
//

import UIKit

class Intro3Controller: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        button.primaryButton()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
