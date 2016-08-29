//
//  navVC.swift
//   Lady Elizabeth
//
//  Created by philip mackie on 04/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit

class navVC: UINavigationController {
    
    // default func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // color of title at the top in nav controller
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        // color of buttons in nav controller
        self.navigationBar.tintColor = .whiteColor()
        
        // color of background of nav controller
        self.navigationBar.barTintColor = UIColor(red: 18.0 / 255.0, green: 100.0 / 255.0, blue: 242.0 / 255.0, alpha: 1)
        
        // disable translucent
        self.navigationBar.translucent = false
    }
    
    
    // white status bar function
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
