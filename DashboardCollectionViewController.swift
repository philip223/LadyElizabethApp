//
//  BashBord.swift
//  Lady Elisabeth
//
//  Created by philip mackie on 01/06/16.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit


class DashboardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    enum DashboardSegue: String {
        case News
        case Gallery
        case DatesAndTerms
        case Login
        case Contacts
        case Transport
    }
    
    typealias Dictionary = [String : AnyObject]
    
    let layout = DashboardFlowLayout()
    let dashboardJson = NSJSONSerialization.parseLocalJSONFile("Dashboard")
    var sections = [Dictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        
        collectionView?.collectionViewLayout = layout
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        guard let json = dashboardJson
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DashboardCollectionViewCell", forIndexPath: indexPath) as! DashboardCollectionViewCell
        
        let items = sections[indexPath.section]["items"] as! [Dictionary]
        let item = items[indexPath.row]
        
        let title = item["title"] as! String?
        let imageName = item["imageName"] as! String
        
        cell.title = title
        cell.image = UIImage(named: imageName)
        
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let items = sections[indexPath.section]["items"] as! [Dictionary]
        let item = items[indexPath.row]
        
        let title = item["title"] as! String!
        let enumTitle = title.capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "")
        guard let segue = DashboardSegue(rawValue: enumTitle)
            else { return }
        
        preformSegue(segue)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return layout.collectionView(collectionView, sizeForItemAtIndexPath: indexPath)
    }
    
    func preformSegue(segue: DashboardSegue) {
        let string = segue.rawValue
        self.performSegueWithIdentifier(string, sender: self)
    }
}

