//
//  LeaderboardModel.swift
//  JamFlight
//
//  Created by Jeremy Adam on 12/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation


class LeaderboardModel {
    var name:String = ""
    var like:Int = 0
    
    init(_ inName:String, _ inLike:Int) {
        name = inName
        like = inLike
    }
}
