//
//  SongViewsController.swift
//  4Play
//
//  Created by iSal on 09/07/19.
//  Copyright © 2019 iSal. All rights reserved.
//

import UIKit

class SongViewsController: UIViewController {
    
    var leftContainer: UIView!
    var rightContainer: UIView!
    var contentScrollView: UIScrollView!
    
    var leaderboardButton: UIButton!
    var jamButton: UIButton!
    
    var avaImage:UIImageView!
    var name:UILabel!
    
    let arrCover: [String] = ["cover1","cover2","cover3"]
    let arrTitle: [String] = ["Avenged Sevenseas","Avenged Sevenseas", "Depappepe"]
    let arrBand: [String] = ["Victim", "Breaking The Habit", "Night Butterfly"]
    let arrBasekey: [String] = ["C Major","D Minor", "A Major"]
    let arrTempo: [String] = ["69 BPM", "120 BPM", "88 BPM"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        configureViews()
        arrangeConstraints()
        contentScrollView.contentSize.width = view.frame.width * CGFloat(arrCover.count)
        for i in 0..<arrCover.count {
            let xPosition:CGFloat =  self.view.frame.width * CGFloat(i)
            let view = UIView()
            
            let coverImage:UIImageView = {
                let imgView = UIImageView(image: UIImage(named: arrCover[i]))
                imgView.contentMode = .scaleAspectFill
                imgView.translatesAutoresizingMaskIntoConstraints = false
                return imgView
            }()
            let titleLabel:UILabel = {
                let label = UILabel()
                label.titleStyle()
                label.text = arrTitle[i]
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            let bandLabel:UILabel = {
                let label = UILabel()
                label.titleBody()
                label.text = arrBand[i]
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            let genreLabel:UILabel = {
                let label = UILabel()
                label.titleBody()
                label.text = arrTempo[i]
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            let tempoLabel:UILabel = {
                let label = UILabel()
                label.titleBody()
                label.text = arrBasekey[i]
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            view.addSubview(coverImage)
            view.addSubview(titleLabel)
            view.addSubview(bandLabel)
            view.addSubview(genreLabel)
            view.addSubview(tempoLabel)
            
            let coverConstraints : [NSLayoutConstraint] = [
                coverImage.topAnchor.constraint(equalTo: view.topAnchor),
                coverImage.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: xPosition-30)
            ]
            NSLayoutConstraint.activate(coverConstraints)
            
            let titleContainer : [NSLayoutConstraint] = [
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
                titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: xPosition-30),
                titleLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: xPosition+30)
            ]
            NSLayoutConstraint.activate(titleContainer)
            
            let bandContainer : [NSLayoutConstraint] = [
                bandLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
                bandLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: xPosition-30),
                bandLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: xPosition+30)
            ]
            NSLayoutConstraint.activate(bandContainer)
            
            let genreContainer : [NSLayoutConstraint] = [
                genreLabel.topAnchor.constraint(equalTo: bandLabel.bottomAnchor,constant: 20),
                genreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: xPosition-30),
                genreLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: xPosition+30)
            ]
            NSLayoutConstraint.activate(genreContainer)
            
            let baseKeyContainer : [NSLayoutConstraint] = [
                tempoLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor,constant: 20),
                tempoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: xPosition-30),
                tempoLabel.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: xPosition+30)
            ]
            NSLayoutConstraint.activate(baseKeyContainer)
            
            
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentScrollView.addSubview(view)
            view.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
            view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6).isActive = true
            
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    fileprivate func configureViews(){
        // Configure Container
        leftContainer = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        rightContainer = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        contentScrollView = {
            let scrollview = UIScrollView(frame: self.view.frame)
            scrollview.isPagingEnabled = true
            scrollview.bounces = false
            scrollview.showsHorizontalScrollIndicator = false
            scrollview.translatesAutoresizingMaskIntoConstraints = false
            return scrollview
        }()
        self.view.addSubview(leftContainer)
        self.view.addSubview(rightContainer)
        self.view.addSubview(contentScrollView)
        
        // left Container configuration
        leaderboardButton  = {
            let button = UIButton()
            button.setTitle("Leaderboard", for: .normal)
            button.addTarget(self, action: #selector(goToLeaderboard(sender:)), for: .touchUpInside)
            button.secondaryButton()
            button.circle()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        leftContainer.addSubview(leaderboardButton)
        
        // right Container configuration
        jamButton = {
            let button = UIButton()
            button.setTitle("Let's Jam!", for: .normal)
            button.addTarget(self, action: #selector(goToJam), for: .touchUpInside)
            button.primaryButton()
            button.circle()
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        rightContainer.addSubview(jamButton)
        
        avaImage = {
            let imageView = UIImageView()
            imageView.backgroundColor = .white
            imageView.layer.cornerRadius = 21
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        name = {
            let label = UILabel()
            label.text = "Profil"
            label.titleBody()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.view.addSubview(avaImage)
        self.view.addSubview(name)
    }
    
    fileprivate func arrangeConstraints(){
        let avaImageConstraints :[NSLayoutConstraint] = [
            avaImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            avaImage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -20),
            avaImage.heightAnchor.constraint(equalToConstant: 42),
            avaImage.widthAnchor.constraint(equalToConstant: 42)
        ]
        NSLayoutConstraint.activate(avaImageConstraints)
        
        let nameConstraints: [NSLayoutConstraint] = [
            name.centerYAnchor.constraint(equalTo: avaImage.centerYAnchor),
            name.rightAnchor.constraint(equalTo: avaImage.leftAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(nameConstraints)
        
        let contentSVConstraints : [NSLayoutConstraint] = [
            contentScrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            contentScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(contentSVConstraints)
        
        let leftConstraints : [NSLayoutConstraint] = [
            leftContainer.topAnchor.constraint(equalTo: view.topAnchor,constant: 25),
            leftContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            leftContainer.rightAnchor.constraint(equalTo: view.centerXAnchor),
            leftContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(leftConstraints)
        
        let rightConstraints : [NSLayoutConstraint] = [
            rightContainer.topAnchor.constraint(equalTo: view.topAnchor,constant: 25),
            rightContainer.leftAnchor.constraint(equalTo: view.centerXAnchor),
            rightContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            rightContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(rightConstraints)

        let jamButtonConstraints : [NSLayoutConstraint] = [
            jamButton.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 10),
            jamButton.centerXAnchor.constraint(equalTo: rightContainer.centerXAnchor),
        ]
        NSLayoutConstraint.activate(jamButtonConstraints)
        
        let leaderboardButtonConstrains : [NSLayoutConstraint] = [
            leaderboardButton.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 10 ),
            leaderboardButton.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor),
        ]
        NSLayoutConstraint.activate(leaderboardButtonConstrains)
    }
    
    @objc func goToJam(sender:UIButton) {
        print("this is jam on Index ", contentScrollView.getPageIndex())
    }
    
    @objc func goToLeaderboard(sender:UIButton){
        print("This is Leaderboard on Index ", contentScrollView.getPageIndex())
    }
}
