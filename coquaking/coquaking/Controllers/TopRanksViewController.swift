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
    private let spacing:CGFloat = 8
    private let refreshControl = UIRefreshControl()
    var kings: KingOfWeeks = []
    var sampleDatas: KingOfWeeks = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        setupRefreshControl()
        
        decodeSampleJSON()
        KingOfWeekService.getKingOfWeekList { kings in
            guard let kings = kings else {
                return
            }
            DispatchQueue.main.async {
                self.kings = kings
                self.kings += self.sampleDatas
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailRanksViewController,
        let index = collectionView.indexPathsForSelectedItems?.first?.item else {
            return
        }
        detailViewController.kings = kings[index]
        detailViewController.navigationItem.title = kings[index].category.koreanTitle
    }
    
    private func decodeSampleJSON() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "earlybird") else {
            return
        }
        
        do {
            sampleDatas = try jsonDecoder.decode(KingOfWeeks.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshRanking(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        let font = UIFont.systemFont(ofSize: 12)
        let color = UIColor.lightGray
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        refreshControl.attributedTitle = NSAttributedString(string: "👑왕님들 업데이트 중입니다👑", attributes: attributes)
    }
    
    @objc private func refreshRanking(_ sender: Any) {
        KingOfWeekService.getKingOfWeekList { kings in
            guard let kings = kings else {
                return
            }
            DispatchQueue.main.async {
                self.kings = kings
                self.kings += self.sampleDatas
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
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
        
        cell.titleLabel.text = category.koreanTitle
        cell.nameLabel.text = king.name
        
        if let thumbnail = king.thumbnail {
            cell.profileImageView.downloaded(from: thumbnail)
        }
        
        cell.layer.cornerRadius = 10
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
        let spacingBetweenCells: CGFloat = 8
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width * 1.3)
    }
}



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    return
            }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {
            return
        }
        downloaded(from: url, contentMode: mode)
    }
}
