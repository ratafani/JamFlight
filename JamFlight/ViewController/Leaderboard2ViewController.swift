//
//  Leaderboard2ViewController.swift
//  JamFlight
//
//  Created by Jeremy Adam on 12/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class Leaderboard2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    var exampleCell:[LeaderboardModel] = [
        LeaderboardModel("Tafa Smith", 1500),
        LeaderboardModel("Faisal", 1200),
        LeaderboardModel("Zahrina", 1000),
        LeaderboardModel("Jeremy", 900),
        LeaderboardModel("Alan", 920),
        LeaderboardModel("Eko", 560),
        LeaderboardModel("Patrio", 220)
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        leaderboardTableView.allowsSelection = false
        ColorBackground().gradientBackground(view: view)
    }
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell") as! leaderboardTableViewCell
        
        cell.posLabel.text = String(indexPath.row + 1)
        cell.nameLabel.text = exampleCell[indexPath.row].name
        cell.likeLabel.text = "\(exampleCell[indexPath.row].like) Likes"

        cell.playButton.tag = indexPath.row
        cell.likeButton.tag = indexPath.row
        
        if indexPath.row < 3 {
            cell.nameLabel.textColor = .orange
            cell.posLabel.textColor = .orange
            cell.likeLabel.textColor = .orange
            cell.medalImageView.image = UIImage(named: "medalIcon")
        }
        
        //Tap Gesture for Play Button
        let tapGesturePlayButton = UITapGestureRecognizer (target: self, action: #selector(playButtonTapped(tapGesture:)))
        tapGesturePlayButton.numberOfTapsRequired = 1
        cell.playButton.isUserInteractionEnabled = true
        cell.playButton.addGestureRecognizer(tapGesturePlayButton)
        
        let tapGestureLikeButton = UITapGestureRecognizer (target: self, action: #selector(likeButtonTapped(tapGesture:)))
        tapGestureLikeButton.numberOfTapsRequired = 1
        cell.likeButton.isUserInteractionEnabled = true
        cell.likeButton.addGestureRecognizer(tapGestureLikeButton)
        
        return cell
        
    }
    //

    @objc func playButtonTapped(tapGesture: UITapGestureRecognizer) {
      
        let indexPath = IndexPath(row: tapGesture.view?.tag ?? 0, section: 0)
        let cell = leaderboardTableView.cellForRow(at: indexPath) as! leaderboardTableViewCell
        
        for i in 0..<exampleCell.count {
            
            if i != tapGesture.view?.tag {
                let cellLooped = leaderboardTableView.cellForRow(at: IndexPath(row: i, section: 0)) as! leaderboardTableViewCell
                
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

        print(cell.nameLabel.text)
    }

    @objc func likeButtonTapped(tapGesture: UITapGestureRecognizer) {
        
        let indexPath = IndexPath(row: tapGesture.view?.tag ?? 0, section: 0)
        let cell = leaderboardTableView.cellForRow(at: indexPath) as! leaderboardTableViewCell
        
        if cell.likeButton.image == UIImage(named: "likedIcon") {
            UIView.transition(with: cell.likeButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { cell.likeButton.image = UIImage(named: "likeIcon") },
                              completion: nil)
        }
        else {
            UIView.transition(with: cell.likeButton,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: { cell.likeButton.image = UIImage(named: "likedIcon") },
                              completion: nil)
        }
        
        print(cell.likeLabel.text)
    }

}
