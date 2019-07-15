//
//  HistoryModel.swift
//  JamFlight
//
//  Created by Jeremy Adam on 15/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation

class HistoryModel {
    var songName:String = ""
    var time:String = ""
    var score:Int = 0
    
    
    init(_ inSongName:String, _ inTime:String, _ inScore:Int) {
        songName = inSongName
        time = inTime
        score = inScore
    }
}
