//
//  NSJSONSerialization.swift
//  Lady Elisabeth
//
//  Created by philip mackie on 02/06/2016.
//  Copyright © 2016 vilet studios. All rights reserved.
//

import Foundation

extension NSJSONSerialization {
    static func parseLocalJSONFile(fileName: String) -> [ String : AnyObject ]? {
        guard
            let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json"),
            let jsonData = NSData(contentsOfFile: path)
            else { return nil }
        
        do {
           let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
            return json as? [String : AnyObject]
        } catch let error as NSError {
            print("JSON parsing error. \(error.localizedDescription)")
        }
        
        return nil
    }
}
