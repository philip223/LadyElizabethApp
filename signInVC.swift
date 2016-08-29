//
//  signInVC.swift
//   Lady Elizabeth
//
//  Created by philip mackie on 04/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//


import UIKit
import Parse

class signInVC: UIViewController {
    
    // textfield
    @IBOutlet var activaty: UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    // buttons
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    
    
    // default func
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        activaty.hidden = true 
        // Pacifico font of label
       
        
        // alignment
        label.frame = CGRectMake(10, 80, self.view.frame.size.width - 20, 50)
        usernameTxt.frame = CGRectMake(10, label.frame.origin.y + 70, self.view.frame.size.width - 20, 30)
        passwordTxt.frame = CGRectMake(10, usernameTxt.frame.origin.y + 40, self.view.frame.size.width - 20, 30)
        
         activaty.frame = CGRectMake(10, usernameTxt.frame.origin.y + 40, self.view.frame.size.width - 20, 30)
        forgotBtn.frame = CGRectMake(10, passwordTxt.frame.origin.y + 30, self.view.frame.size.width - 20, 30)
        
        signInBtn.frame = CGRectMake(20, forgotBtn.frame.origin.y + 40, self.view.frame.size.width / 4, 30)
        signInBtn.layer.cornerRadius = signInBtn.frame.size.width / 20
        
        signUpBtn.frame = CGRectMake(self.view.frame.size.width - self.view.frame.size.width / 4 - 20, signInBtn.frame.origin.y, self.view.frame.size.width / 4, 30)
        signUpBtn.layer.cornerRadius = signUpBtn.frame.size.width / 20
        
        // tap to hide keyboard
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(signInVC.hideKeyboard(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        // background
        let bg = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        bg.image = UIImage(named: "bggb.jpg")
        bg.layer.zPosition = -1
        self.view.addSubview(bg)
    }
    
    
    // hide keyboard func
    func hideKeyboard(recognizer : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    
    // clicked sign in button
    
    @IBAction func signIn() {
    
        activaty.startAnimating()
        activaty.hidden = false
        print("sign in pressed")
        
        // hide keyboard
        self.view.endEditing(true)
        
        // if textfields are empty
        if usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty {
            
            // show alert message
            let alert = UIAlertController(title: "Please", message: "fill in fields", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(ok)
        
            self.presentViewController(alert, animated: true, completion: nil)
          
        activaty.stopAnimating()
        activaty.hidden = true
        }
        
        
        // login functions
        PFUser.logInWithUsernameInBackground(usernameTxt.text!, password: passwordTxt.text!) { (user:PFUser?, error:NSError?) -> Void in
            if error == nil {
               self.activaty.stopAnimating()
                self.activaty.hidden = true
                
                // remember user or save in App Memeory did the user login or not
                NSUserDefaults.standardUserDefaults().setObject(user!.username, forKey: "username")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                // call login function from AppDelegate.swift class
                let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.login()
            
            } else {
                
                // show alert message
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(ok)
            
                
                self.presentViewController(alert, animated: true, completion: nil)
            
                self.activaty.stopAnimating()
                self.activaty.hidden = true

            
            }
            
            
        }
        
    }
    
}
