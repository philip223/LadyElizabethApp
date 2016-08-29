//
//  GalleryCollectionViewCell.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 06/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    

        }
    


