//
//  pictureCell.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 04/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//


import UIKit

class pictureCell: UICollectionViewCell {
    
    // holds post picture
    @IBOutlet weak var picImg: UIImageView!
    
    
    // default func
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // alignment
        let width = UIScreen.mainScreen().bounds.width
        picImg.frame = CGRectMake(0, 0, width / 3, width / 3)
    }
    
}
