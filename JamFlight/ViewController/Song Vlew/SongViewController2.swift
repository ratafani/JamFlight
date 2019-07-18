//
//  SongViewController2.swift
//  4Play
//
//  Created by iSal on 15/07/19.
//  Copyright © 2019 iSal. All rights reserved.
//

import UIKit

class SongViewController2: UIViewController, UIScrollViewDelegate {
    
    var leftContainer: UIView!
    var rightContainer: UIView!
    
    var coverImage: UIImageView!
    var titleLabel: UILabel!
    var baseKeyLabel: UILabel!
    var bandLabel: UILabel!
    var genreLabel: UILabel!
    
    @IBOutlet weak var jamButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var contentScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contentScrollView.delegate = self
        setGradientBackground()
        configureViews()
        arrangeConstraints()
        setupScrollView()
    }
    
    func configureViews(){
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
        self.view.addSubview(leftContainer)
        self.view.addSubview(rightContainer)
        
        // left Container configuration
        coverImage = {
            let imgView = UIImageView(image: UIImage(named: "cover1"))
            imgView.contentMode = .scaleAspectFill
            imgView.translatesAutoresizingMaskIntoConstraints = false
            return imgView
        }()
        
        // right Container configuration
        titleLabel = {
            let label = UILabel()
            label.titleStyle()
            label.text = "Sakit Kulit"
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        bandLabel = {
            let label = UILabel()
            label.titleBody()
            label.text = "Totol"
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        genreLabel = {
            let label = UILabel()
            label.titleBody()
            label.text = "Alternative Rock"
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        baseKeyLabel = {
            let label = UILabel()
            label.titleBody()
            label.text = "C Major"
            
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    }
    
    func arrangeConstraints(){
    
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
        
        let coverConstraints : [NSLayoutConstraint] = [
            coverImage.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            coverImage.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            coverImage.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor)
        ]
//                NSLayoutConstraint.activate(coverConstraints)
    
        let titleContainer : [NSLayoutConstraint] = [
            titleLabel.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightContainer.rightAnchor, constant: -30),
            titleLabel.leftAnchor.constraint(equalTo: rightContainer.leftAnchor, constant: 30)
        ]
//                NSLayoutConstraint.activate(titleContainer)
    
        let bandContainer : [NSLayoutConstraint] = [
            bandLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            bandLabel.rightAnchor.constraint(equalTo: rightContainer.rightAnchor, constant: -30),
            bandLabel.leftAnchor.constraint(equalTo: rightContainer.leftAnchor, constant: 30)
        ]
//                NSLayoutConstraint.activate(bandContainer)
    
        let genreContainer : [NSLayoutConstraint] = [
            genreLabel.topAnchor.constraint(equalTo: bandLabel.bottomAnchor,constant: 20),
            genreLabel.rightAnchor.constraint(equalTo: rightContainer.rightAnchor, constant: -30),
            genreLabel.leftAnchor.constraint(equalTo: rightContainer.leftAnchor, constant: 30)
        ]
//                NSLayoutConstraint.activate(genreContainer)
    
        let baseKeyContainer : [NSLayoutConstraint] = [
            baseKeyLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor,constant: 20),
            baseKeyLabel.rightAnchor.constraint(equalTo: rightContainer.rightAnchor, constant: -30),
            baseKeyLabel.leftAnchor.constraint(equalTo: rightContainer.leftAnchor, constant: 30)
        ]
//                NSLayoutConstraint.activate(baseKeyContainer)
    }
    
    fileprivate func setupScrollView(){
        contentScrollView.contentSize.width = contentScrollView.frame.width * 3
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsHorizontalScrollIndicator = false
        
        for i in 0..<3{
            let view = UIView()
            let xPosition = contentScrollView.frame.width * CGFloat(i)
            view.frame = CGRect(x: xPosition, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
            
            view.addSubview(coverImage)
            view.addSubview(titleLabel)
            view.addSubview(bandLabel)
            view.addSubview(genreLabel)
            view.addSubview(baseKeyLabel)
            
            contentScrollView.addSubview(view)
        }
    }

}
