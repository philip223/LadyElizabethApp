//
//  DatesViewController.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 06/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//
import UIKit

class DatesViewController: UIViewController {

    @IBOutlet var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
      textview.inputView = UIView()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
