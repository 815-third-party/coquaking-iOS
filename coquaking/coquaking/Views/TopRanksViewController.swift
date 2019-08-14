//
//  TopRanksViewController.swift
//  coquaking
//
//  Created by CHOMINJI on 14/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class TopRanksViewController: UIViewController {
    private let cellReuseID = "TopRankCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension TopRanksViewController: UICollectionViewDelegate {
    
}

extension TopRanksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRankCell", for: indexPath) as? TopRankCollectionViewCell else {
            return .init()
        }
        cell.titleLabel.text = "낮코왕"
        cell.profileImageView.backgroundColor = .red
        cell.nameLabel.text = "mindy"
        
        return cell
    }
    
    
}
