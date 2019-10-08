//
//  UINavigationController.swift
//  DTY
//
//  Created by MAC240 on 07/06/19.
//  Copyright © 2019 MAC240. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func configureSolidNavigationBar() {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple,
                                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor.white
        navigationBar.tintColor = UIColor.purple
        navigationBar.isTranslucent = false
    }
}
