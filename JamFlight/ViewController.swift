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
    var mText : UILabel!
    
    var chordArray : [String:Int] = [:]
    var falseArray : [String:Int] = [:]
    var chordScale : [String] = []
    var scoreBeat : [Int] = []
    var startBtn : UIButton!
    var stopBtn : UIButton!
    
    var timer : Timer? = nil
    var tBeat : Timer? = nil
    var total = 0
    var scoreTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("run")
        audiokitInit()
        mText = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        startBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        stopBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        
        mText.center = view.center
        mText.textColor = .black
        
        startBtn.center = CGPoint(x: mText.center.x, y: mText.center.y - 80)
        stopBtn.center = CGPoint(x: mText.center.x, y: startBtn.center.y + 160)
        
        startBtn.backgroundColor = .red
        stopBtn.backgroundColor = .red
        view.addSubview(startBtn)
        view.addSubview(stopBtn)
        
        startBtn.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
        stopBtn.addTarget(self, action: #selector(stop(_:)), for: .touchUpInside)
        
        view.addSubview(mText)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    @objc func start(_ sender: UIView) {
//        restartView()
        chordArray = [:]
        startCounting()
    }
    
    @objc func stop(_ sender: UIView) {
        //        restartView()
        do{
            try AudioKit.stop()
            timer?.invalidate()
            tBeat?.invalidate()
            timer = nil
            tBeat = nil
        }catch{
            print(error)
        }
        print(scoreTotal)
        scoreTotal = 0
//        scoring()
    }
    
    func startCounting(){
        total = 0
        do{
            //reseting audiokit
            try AudioKit.stop()
            AudioKit.output = silence
            //start audiokit
            try AudioKit.start()
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:  #selector(record), userInfo: nil, repeats: true)
            tBeat = Timer.scheduledTimer(timeInterval: 0.7143, target:self, selector:  #selector(score), userInfo: nil, repeats: true)
            
        }catch{
            print(error)
        }
    }
    
    func audiokitInit(){
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        AKSettings.audioInputEnabled = true
    }
    
    let dScale : [String] = ["D","E","F#","G","A","B","C#"]
    let cScale : [String] = ["D","E","F","G","A","B","C"]
    
    @objc func record(){
        let chord = Dsp().freqToChord(f: tracker.frequency)
        
        
        if (abs(chord.cent) < 10) && (chord.octav>1) && (chord.octav<6) {
            let cs = "\(chord.chord)\(chord.octav)"
            chordScale.append(cs)
        }
        
        for c in cScale{
            if chord.chord == c && (abs(chord.cent) < 10) && (chord.octav>1) && (chord.octav<6){
                total += 1
                let name = c+"\(chord.octav)"
                if chordArray[name] != nil{
                   chordArray[name] = chordArray[name]! + 1
                }else{
                    chordArray[name] = 1
                }
                break
            }
        }
        mText.text = "\(chord)"
    }
    
    @objc func score(){
        if chordArray.count == 1 && (total-chordScale.count == 0){
            print(1)
            scoreTotal += 1
        }else{
            let beatnum = chordScale.count
            let falsenum = beatnum - total
            let score1 = (beatnum - falsenum) * chordArray.count
            scoreTotal += score1
            print(beatnum,total,falsenum,score1)
        }
        print("scale",chordScale)
        print("weight",chordArray)
        print()
        chordScale = []
        total = 0
        chordArray = [:]
    }
    
    
}

