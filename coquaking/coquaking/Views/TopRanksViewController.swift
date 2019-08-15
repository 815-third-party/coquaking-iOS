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
    private let spacing:CGFloat = 16.0
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
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
        cell.nameLabel.text = "mindy"
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        cell.layer.shadowRadius = 25.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(
            roundedRect: cell.bounds,
            cornerRadius: cell.layer.cornerRadius
            ).cgPath
        
        return cell
    }
}

extension TopRanksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = 16
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width * 1.3)
    }
}
