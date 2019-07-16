//
//  HistoryViewController.swift
//  JamFlight
//
//  Created by Jeremy Adam on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var historyTableView: UITableView!
    
    var exampleCell:[HistoryModel] = [
        HistoryModel("B-Team", "22:12", 2409),
        HistoryModel("B-Team", "22:04", 2305),
        HistoryModel("B-Team", "22:00", 2264),
        HistoryModel("B-Team", "21:54", 2102)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.allowsSelection = false
        
        ColorBackground().gradientBackground(view: view)
        
        historyTableView.backgroundColor = .clear
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryTableViewCell
        
        cell.backgroundColor = .clear
        
        cell.playButton.tag = indexPath.row
        
        cell.songNameLabel.text = exampleCell[indexPath.row].songName
        cell.timeLabel.text = exampleCell[indexPath.row].time
        cell.scoreLabel.text = String(exampleCell[indexPath.row].score)
        
        let tapGesturePlayButton = UITapGestureRecognizer (target: self, action: #selector(playButtonTapped(tapGesture:)))
        tapGesturePlayButton.numberOfTapsRequired = 1
        cell.playButton.isUserInteractionEnabled = true
        cell.playButton.addGestureRecognizer(tapGesturePlayButton)
        
        
        return cell
    }
    
    
    @objc func playButtonTapped(tapGesture: UITapGestureRecognizer) {
        
        let indexPath = IndexPath(row: tapGesture.view?.tag ?? 0, section: 0)
        let cell = historyTableView.cellForRow(at: indexPath) as! HistoryTableViewCell
        
        for i in 0..<exampleCell.count {
            
            if i != tapGesture.view?.tag {
                let cellLooped = historyTableView.cellForRow(at: IndexPath(row: i, section: 0)) as! HistoryTableViewCell
                
                UIView.transition(with: cellLooped.playButton,
                                  duration: 0.15,
                                  options: .transitionCrossDissolve,
                                  animations: { cellLooped.playButton.image = UIImage(named: "playButton") },
                                  completion: nil)
            }
            
        }
        
        
        if cell.playButton.image == UIImage(named: "playButton") {
            UIView.transition(with: cell.playButton,
                              duration: 0.15,
                              options: .transitionCrossDissolve,
                              animations: { cell.playButton.image = UIImage(named: "pauseButton") },
                              completion: nil)
            
            
            
        }
        else {
            UIView.transition(with: cell.playButton,
                              duration: 0.15,
                              options: .transitionCrossDissolve,
                              animations: { cell.playButton.image = UIImage(named: "playButton") },
                              completion: nil)
        }
        
        print(cell.scoreLabel.text)
    }

}
