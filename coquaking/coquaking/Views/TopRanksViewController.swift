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
    var kings: KingOfWeeks = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        KingOfWeekService.getKingOfWeekList { kings in
            guard let kings = kings else {
                return
            }
            DispatchQueue.main.async {
                self.kings = kings
                self.collectionView.reloadData()
            }
        }
    }
}

extension TopRanksViewController: UICollectionViewDelegate {
   
}

extension TopRanksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRankCell", for: indexPath) as? TopRankCollectionViewCell else {
            return .init()
        }
        let category = kings[indexPath.item].category
        let king = kings[indexPath.item].first
        
        cell.titleLabel.text = category
        cell.nameLabel.text = king.name
        
        if let thumbnail = king.thumbnail {
            cell.profileImageView.downloaded(from: thumbnail)
        }
        
        
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



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

