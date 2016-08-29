//
//  galleryTableViewCell.swift
//  Lady Elisabeth
//
//  Created by philip mackie on 01/06/16.
//  Copyright © 2016 vilet studios. All rights reserved.
//


import UIKit

class galleryTableViewCell: UITableViewCell {

    @IBOutlet var Picture: UIImageView!
    
    @IBOutlet var author: UILabel!
    
    @IBOutlet var profile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
