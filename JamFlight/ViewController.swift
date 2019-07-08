//
//  ViewController.swift
//  JamFlight
//
//  Created by Muhammad Tafani Rabbani on 08/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import AudioKit

struct chordData {
    var chord : String
    var octav : Int
    var cent : Int
}
class ViewController: UIViewController {
    let mic = AKMicrophone()
    var tracker = AKFrequencyTracker()
    var silence: AKBooster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        AKSettings.audioInputEnabled = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        do{
            try AudioKit.stop()
            AudioKit.output = silence
            try AudioKit.start()
            
            _ = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:  #selector(record), userInfo: nil, repeats: true)
            
        }catch{
            print(error)
        }
    }
    
    @objc func record(){
        let chord = freqToChord(f: tracker.frequency)
        print(chord)
    }
    
    let chordArr : [String] = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
    func freqToChord(f:Double)->chordData{
        let f1 = log2(f/440 ) * 12
        let cent = Int(f1*100)%100
        let octav = 4 + (Int(log2(f/440).rounded()))
        let move = Int(f1.rounded()) % 12
        var chord = ""
        if move < 0{
            chord = chordArr[12+move]
        }else{
            chord = chordArr[move]
        }
        let cData:chordData = chordData(chord: chord, octav: octav, cent: cent)
        return cData
    }
}

