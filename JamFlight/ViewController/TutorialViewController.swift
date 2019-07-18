//
//  TutorialViewController.swift
//  JamFlight
//
//  Created by Alan Santoso on 18/07/19.
//  Copyright © 2019 Muhammad Tafani Rabbani. All rights reserved.
//

import UIKit
import AVKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var videoView: UIImageView!
    
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = .clear
        ColorBackground().gradientBackground(view: view)
        
        videoView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.videoView.addGestureRecognizer(gesture)
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    @objc func checkAction(){
        print("heil")
        
        let path = Bundle.main.path(forResource: "VideoTutorial", ofType: "mp4")
        print(path as Any)
        
        if let path = Bundle.main.path(forResource: "VideoTutorial", ofType: "mp4"){
            
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            
            present(videoPlayer, animated: true, completion: {
                video.play()
                
            })
            
        }
    }
    
    //WHEN VIDEO FINIDHED
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
            NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func videoDidEnd(notification: NSNotification) {
        print("video ended")
        dismiss(animated: true) {
            
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //DEVICE KEEP LANDSCAPE
    override var shouldAutorotate: Bool {
        return true
    }
    
    

}
