//
//  HistoryTableViewCell.swift
//  JamFlight
//
//  Created by Jeremy Adam on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        songNameLabel.textColor = .white
        timeLabel.textColor = .white
        scoreLabel.textColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
