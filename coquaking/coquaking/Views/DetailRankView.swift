//
//  DetailRankView.swift
//  coquaking
//
//  Created by CHOMINJI on 14/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

@IBDesignable class DetailRankView: UIView {
    private let xibName = "DetailRankView"
    var view: UIView?
    @IBInspectable var image: UIImage? {
        get {
            return profileImageView.image
        }
        set(image) {
            profileImageView.image = image
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
         guard let view = loadViewFromNib() else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [AutoresizingMask.flexibleWidth, AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: DetailRankView.self)
        let nib = UINib(nibName: xibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
}
