//
//  Dsp.swift
//  JamFlight
//
//  Created by Muhammad Tafani Rabbani on 08/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import Foundation

class Dsp{
    let aFrequency = 440.0
    let chordArr : [String] = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
    //change freq to Chord
    func freqToChord(f:Double)->chordData{
        let f1 = log2(f/aFrequency ) * 12
        if (f1.isNaN) || (f1.isInfinite){
            print("failed")
            return chordData(chord: "", octav: 0, cent: 0)
        }else{
            var cent = Int(f1*100)%100
            if cent < -50 {cent = -100 - cent}
            else if cent > 50 {cent = 100 - cent}
            
            let octav = 4 + (Int(log2(f/440).rounded()))
            
            let move = Int(f1.rounded()) % 12
            
            var chord = ""
            if move < 0{
                chord = chordArr[12+move]
            }else{
                chord = chordArr[move]
            }
            
            let cData:chordData = chordData(chord: chord, octav: Int8(octav), cent: Int8(cent))
            return cData
        }
    }
}

struct chordData {
    var chord : String
    var octav : Int8
    var cent : Int8
}
