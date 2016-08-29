//
//  GalleryTableViewController.swift
// Lady Elisabeth
//
//  Created by philip mackie on 01/06/16.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit
import Parse


class GalleryTableViewController: UITableViewController {

    var picArray = [PFFile]()
    var profile = [PFFile]()
    var author = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let query = PFQuery(className: "Gallery")
        
       query.findObjectsInBackgroundWithBlock ({ (objects:[PFObject]?, error:NSError?) -> Void in
            
        if error == nil {
            
         self.author.removeAll(keepCapacity: true)
            self.picArray.removeAll(keepCapacity: true)
            self.profile.removeAll(keepCapacity: true)
            
            for objects in objects! {
                
                self.author.insert(objects["writer"] as! String, atIndex: 0)
                self.picArray.insert(objects["Picture"] as! PFFile, atIndex: 0)
                self.profile.insert(objects["profile"] as! PFFile, atIndex: 0)
                
            }
            
            
        }
       
        self.tableView.reloadData()

       
       
       })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return picArray.count
    }

    
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! galleryTableViewCell
        
        cell.author.text = author[indexPath.row]
        profile[indexPath.row].getDataInBackgroundWithBlock { (data:NSData?, error:NSError?) -> Void in
            cell.profile.image = UIImage(data: data!)
        }
        
        picArray[indexPath.row].getDataInBackgroundWithBlock { (data:NSData?, error:NSError?) -> Void in
            cell.Picture.image = UIImage(data: data!)
        }

        
        
    
    return cell
    
    }
    
    
    
    
}
