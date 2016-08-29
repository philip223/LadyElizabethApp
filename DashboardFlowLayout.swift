//
//  DashboardFlowLayout.swift
//  Lady Elisabeth
//
//  Created by philip mackie on 02/06/16.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit

class DashboardFlowLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init() {
        super.init()
        commonInit()
    }
    
    func commonInit() {
        minimumLineSpacing = 1.0
    }
    
    func collectionView(collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 167.0)
    }
    
}
