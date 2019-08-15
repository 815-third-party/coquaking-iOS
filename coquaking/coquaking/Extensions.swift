//
//  Extensions.swift
//  coquaking
//
//  Created by CHOMINJI on 15/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

extension UIViewController {
    //네비게이션 바 투명하게 하는 함수
    func clearNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    func setBackBtn(color : UIColor){
        let backBTN = UIBarButtonItem(image: UIImage(named: "buttonsArrowBack"),
            style: .plain,
            target: self,
            action: #selector(self.pop))
        navigationItem.leftBarButtonItem = backBTN
        navigationItem.leftBarButtonItem?.tintColor = color
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
}
