//
//  GradeTableViewCell.swift
//  JamFlight
//
//  Created by Alan Santoso on 16/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit

class GradeTableViewCell: UITableViewCell {

    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var avgScoreLabel: UILabel!
    
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        songNameLabel.textColor = .white
        avgScoreLabel.textColor = .white
        bestScoreLabel.textColor = .white

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
