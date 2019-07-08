//
//  ViewController.swift
//  JamFlight
//
//  Created by Muhammad Tafani Rabbani on 08/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import AudioKit

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
        let chord = Dsp().freqToChord(f: tracker.frequency)
        print(chord)
    }
    
}

