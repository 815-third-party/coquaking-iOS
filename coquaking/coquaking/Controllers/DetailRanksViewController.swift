//
//  DetailRanksViewController.swift
//  coquaking
//
//  Created by CHOMINJI on 14/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class DetailRanksViewController: UIViewController {
    var kings: KingOfWeek!
    
    @IBOutlet weak var firstRankView: DetailRankView!
    @IBOutlet weak var secondRankView: DetailRankView!
    @IBOutlet weak var thirdRankView: DetailRankView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackBtn(color: .black)
        clearNavigationBar()
        
        let first = kings.first
        let second = kings.second
        let third = kings.third
        firstRankView.nameLabel.text = first.name
        secondRankView.nameLabel.text = second.name
        thirdRankView.nameLabel.text = third.name
        
        firstRankView.crownImageView.image = UIImage(named: "imgCrown")
        secondRankView.crownImageView.image = UIImage(named: "imgSilverCrown")
        thirdRankView.crownImageView.image = UIImage(named: "imgBronzeCrown")
        
        if let firstThumbnail = first.thumbnail {
            firstRankView.profileImageView.downloaded(from: firstThumbnail)
        }
        
        if let secondThumbnail = second.thumbnail {
            secondRankView.profileImageView.downloaded(from: secondThumbnail)
        }
        
        if let thirdThumbnail = third.thumbnail {
            thirdRankView.profileImageView.downloaded(from: thirdThumbnail)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        firstRankView.profileImageView.layer.cornerRadius = firstRankView.profileImageView.bounds.width / 2
//        secondRankView.profileImageView.layer.cornerRadius = secondRankView.profileImageView.bounds.width / 2
//        thirdRankView.profileImageView.layer.cornerRadius = thirdRankView.profileImageView.bounds.width / 2
//        firstRankView.profileImageView.layoutIfNeeded()
//        secondRankView.profileImageView.layoutIfNeeded()
//        thirdRankView.profileImageView.layoutIfNeeded()
        
    }
}
