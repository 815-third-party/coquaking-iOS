//
//  RoundImageView.swift
//  coquaking
//
//  Created by CHOMINJI on 15/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    override func awakeFromNib() {
        layer.masksToBounds = true
        layer.cornerRadius =  bounds.width / 2
        layoutIfNeeded()
    }
}
