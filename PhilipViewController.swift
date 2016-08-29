//
//  PhilipViewController.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 30/06/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import UIKit
import Parse

class PhilipViewController: UIViewController {

   
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var emailAdress: UITextField!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(PhilipViewController.hideKeyboard(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
     
    }
    
    func hideKeyboard(recognizer : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func send() {
    
    
        self.view.endEditing(true)
      
        
        
        
        
        if (fullName.text!.isEmpty || emailAdress.text!.isEmpty ) {
            
            let alert = UIAlertController(title: "Oppps!", message: "Please fill all text boxes", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            
            
            
            
            let alert = UIAlertController(title: "Thank you", message: "I will try to contact you in the next 24-72 hours", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            
            }
            
            let contact = PFObject(className: "cantact")
            
            contact["name"] = fullName.text
            
            
            contact["email"] = emailAdress.text
            
            
            contact.saveInBackgroundWithBlock { (success, error) -> Void in
                
                
            }
            
            
        }
        
        
        
        
    }
    
    

