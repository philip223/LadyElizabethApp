//
//  WebViewController.swift
//  Lady Elizabeth
//
//  Created by philip mackie on 06/07/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//
import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
        
    
   
    
        @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let url = NSURL(string: "http://generator.appprivacy.net/export/578bc796e5680/")   
        
        let urlRequest = NSURLRequest(URL: url!)
        
        webView.loadRequest(urlRequest)
}

}
