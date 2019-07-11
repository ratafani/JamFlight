//
//  ViewController.swift
//  JamFlight
//
//  Created by Muhammad Tafani Rabbani on 08/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import AudioKit
import AVFoundation

class ViewController: UIViewController , AVAudioRecorderDelegate{
    
    let mic = AKMicrophone()
    var tracker = AKFrequencyTracker()
    var silence: AKBooster!
    
    var player: AKPlayer!
    
    var chordArray : [String:Int] = [:]
    var falseArray : [String:Int] = [:]
    var chordScale : [String] = []
    var scoreBeat : [Int] = []
    var duration : Double = 0.0
    
    //declare View
    var startBtn : UIButton!
    var stopBtn : UIButton!
    var playback : UIButton!
    var mText : UILabel!
    var dots : [UIView] = []
    
    //declare time
    var timer : Timer? = nil
    var tBeat : Timer? = nil
    var total = 0
    var scoreTotal = 0
    var idx = 0
    
    let colors = Colors()
    
    //declare instance variable
    var audioRecorder:AVAudioRecorder!
    var urlAudioRecorded : URL!
    var avPlayer: AVAudioPlayer?
    
    let dScale : [String] = ["D","E","F#","G","A","B","C#"]
    let cScale : [String] = ["D","E","F","G","A","B","C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColorBackground().gradientBackground(view: view)
        audiokitInit()
        initVIew()
    }
    
    func recordAudio(){
        do {
            let audioSession:AVAudioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
            let recordSettings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            urlAudioRecorded = audioFilename
            var error: NSError?
            
            try audioRecorder = AVAudioRecorder(url: audioFilename, settings: recordSettings)
            if let e = error {
                print(e.localizedDescription)
            } else {
                audioRecorder.record()
            }
        }catch{
            print(error)
        }
    }
    
    @objc func start(_ sender: UIView) {
        makingDots()
        chordArray = [:]
        startCounting()
        recordAudio()
    }
    
    @objc func playRecording(_ sender: UIView) {
        playAudioFile(theUrl: urlAudioRecorded)
    }
    
    @objc func stop(_ sender: UIView) {
        stopAll()
    }
    
    func playAudioFile(theUrl url:URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            avPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let player2 = avPlayer else { return }
            player2.volume = 0.05
            player2.play()
            let duration = player2.duration
            print(duration)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopAll(){
        avPlayer?.stop()
        audioRecorder.stop()
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
    }
    
    func startCounting(){
        total = 0
        do{
            //reseting audiokit
            try AudioKit.stop()
            
            AudioKit.output = silence
            //start audiokit
            try AudioKit.start()
            
            guard let url = Bundle.main.url(forResource: "example", withExtension: "mp3") else { return }
            playAudioFile(theUrl: url)
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:  #selector(record), userInfo: nil, repeats: true)
            tBeat = Timer.scheduledTimer(timeInterval: 0.5714, target:self, selector:  #selector(score), userInfo: nil, repeats: true)
            
        }catch{
            print(error)
        }
    }
    
    func audiokitInit(){
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        AKSettings.audioInputEnabled = true
    }
    
    func makingDots(){
        for v in dots{
            v.removeFromSuperview()
        }
        idx = 0
        dots = []
        let width = Int(view.center.x * 2)
        for i in 0...width{
            if i%7 == 0{
                let dot = UIView(frame: CGRect(x: i, y: 200, width: 5, height: 5))
                dot.backgroundColor = .gray
                //                dot.layer.borderWidth = 1
                //                dot.layer.borderColor = UIColor.white.cgColor
                dot.layer.cornerRadius = 2.5
                dots.append(dot)
                view.addSubview(dot)
            }
        }
    }
    
    @objc func record(){
        let chord = Dsp().freqToChord(f: tracker.frequency)
        
        if idx >= dots.count-1 {
            stopAll()
        }
        
        UIView.animate(withDuration: 0.1) {
            if CGFloat(self.tracker.frequency/10) > 20{
                self.dots[self.idx].bounds.size.height = 20
            }
            self.dots[self.idx].bounds.size.height = CGFloat(self.tracker.frequency/10)
            self.dots[self.idx].backgroundColor = .red
        }
        
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
    }
    
    @objc func score(){
        if chordArray.count == 0{
            scoreTotal -= 2
        } else
        if chordArray.count == 1 && (total-chordScale.count == 0){
            print(1)
            scoreTotal -= 5
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
      
        idx += 1
        mText.text = "Your Score \(scoreTotal)"
    }
    
    func initVIew(){
        mText = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 100))
        startBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        stopBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        playback = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        mText.center = CGPoint(x: view.center.x, y: view.center.y - 160)
        mText.textColor = .black
        mText.textAlignment = .center
        mText.textColor = .white
        mText.font = mText.font.withSize(40)
        
        startBtn.center = CGPoint(x: view.center.x - 160, y: view.center.y + 160)
        stopBtn.center = CGPoint(x: view.center.x + 160, y: view.center.y + 160)
        playback.center = CGPoint(x: view.center.x, y: view.center.y + 80)
        
        startBtn.backgroundColor = .red
        stopBtn.backgroundColor = .red
        playback.backgroundColor = .red
        
        startBtn.setTitle("Start", for: .normal)
        stopBtn.setTitle("Stop", for: .normal)
        playback.setTitle("Play", for: .normal)
        
        view.addSubview(startBtn)
        view.addSubview(stopBtn)
        view.addSubview(playback)
        makingDots()
        startBtn.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
        stopBtn.addTarget(self, action: #selector(stop(_:)), for: .touchUpInside)
        playback.addTarget(self, action: #selector(playRecording(_:)), for: .touchUpInside)
        
        view.addSubview(mText)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
