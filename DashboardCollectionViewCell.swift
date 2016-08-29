//
//  DashboardCollectionViewCell.swift
//  Lady Elisabeth
//
//  Created by philip mackie on 01/06/16.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit

public class DashboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var gradientView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    
    
                
            }
 
