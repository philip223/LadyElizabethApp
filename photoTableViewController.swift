//
//  photoTableViewController.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 06/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit
class PhotoCollectionViewController:
UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    typealias Dictionary = [String : AnyObject]
    
    let layout = GalleryFlowLayout()
    let GalleryJson = NSJSONSerialization.parseLocalJSONFile("Gallery")
    var sections = [Dictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        
        collectionView?.collectionViewLayout = layout
       // collectionView?.backgroundColor = UIColor.blueColor()
        
        guard let json = GalleryJson
            else { return }
        
        sections = json["sections"] as! [Dictionary]
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let items = sections[section]["items"] as! [Dictionary]
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! GalleryCollectionViewCell
        
        let items = sections[indexPath.section]["items"] as! [Dictionary]
        let item = items[indexPath.row]
        
        
        let imageName = item["imageName"] as! String
        
        
        cell.image = UIImage(named: imageName)
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return layout.GallerycollectionView(collectionView, sizeForItemAtIndexPath: indexPath)
    }
    
  }



