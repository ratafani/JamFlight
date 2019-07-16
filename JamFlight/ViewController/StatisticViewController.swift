//
//  StatisticViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
    @IBOutlet weak var popularityView: UIView!
    @IBOutlet weak var gradesView: UIView!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Statistics"
        // Do any additional setup after loading the view.
        ColorBackground().gradientBackground(view: view)
        segmentedControll.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        popularityView.isHidden = false
        gradesView.isHidden = true
        likesLabel.textColor = .white
        monthLabel.textColor = .white
        
      
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if segmentedControll.selectedSegmentIndex == 0 {
            print("on pertma")
            popularityView.isHidden = false
            gradesView.isHidden = true
            
            likesLabel.isHidden = false
            monthLabel.isHidden = false
        }else{
            print("on kedua")
            popularityView.isHidden = true
            gradesView.isHidden = false
            
            likesLabel.isHidden = true
            monthLabel.isHidden = true
        }
    }

    

}
