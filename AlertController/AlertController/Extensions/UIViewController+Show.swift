//
//  UIWindow+Show.swift
//  AlertController
//
//  Created by Saad Albasha on 8/6/19.
//  Copyright © 2019 AaoIi. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func show(animated flag: Bool, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindow.Level.alert
        window.makeKeyAndVisible()
        window.rootViewController!.present(self, animated: flag, completion: completion)
    }
    
}
