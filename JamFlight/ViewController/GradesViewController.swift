//
//  GradesViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var gradeTableView: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var songNameHeader: UILabel!
    @IBOutlet weak var averageScoreHeader: UILabel!
    @IBOutlet weak var bestScoreHeader: UILabel!
    
    
    
    
    
    var gradeList :[Grade]  = [
        Grade("B-Team", 2155, 2255),
        Grade("When you hate someone", 230, 2245),
        Grade("Sakit gigi", 2254, 255),
        Grade("Sakit gigi", 2254, 255),
        Grade("Sakit gigi", 2254, 255),
        Grade("Sakit gigi", 2254, 255)

        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gradeTableView.delegate = self
        gradeTableView.dataSource = self
        gradeTableView.allowsSelection = false
        self.view.backgroundColor = .clear
        gradeTableView.backgroundColor = .clear
        setupHeader()
    }
    
    func setupHeader(){
        headerView.backgroundColor = .clear
        songNameHeader.textColor = .goldTheme
        averageScoreHeader.textColor = .goldTheme
        bestScoreHeader.textColor = .goldTheme
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = gradeTableView.dequeueReusableCell(withIdentifier: "cellsss") as! GradeTableViewCell
        
        cell.backgroundColor = .clear
        
        cell.songNameLabel.text = gradeList[indexPath.row].songName
        cell.avgScoreLabel.text = String(gradeList[indexPath.row].avgScore)
        cell.bestScoreLabel.text = String(gradeList[indexPath.row].bestScore)

        
        return cell
    }
    
    



}
