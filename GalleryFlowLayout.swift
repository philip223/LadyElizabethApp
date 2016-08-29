//
//  GalleryFlowLayout.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 06/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit

class GalleryFlowLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init() {
        super.init()
        commonInit()
    }
    
    func commonInit() {
        minimumLineSpacing = 10.0
    }
   
    func GallerycollectionView(collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 230.0)
    }
    
}