//
//  Grade.swift
//  JamFlight
//
//  Created by Alan Santoso on 16/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation

class Grade{
    var songName : String
    var avgScore : Int
    var bestScore : Int
    
    init(_ inSongName : String, _ inAvgScore : Int, _ inBestScore : Int) {
        songName = inSongName
        avgScore = inAvgScore
        bestScore = inBestScore
    }
    
    
}
