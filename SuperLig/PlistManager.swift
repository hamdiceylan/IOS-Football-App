//
//  PlistManager.swift
//  RmosDevremulkAnket
//
//  Created by RMOS on 28/11/15.
//  Copyright © 2015 RMOS. All rights reserved.
//

import Foundation

class PlistManager {
    
    func loadData(key : NSString) -> NSString {
        // getting path to GameData.plist
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        //let path = documentsDirectory.stringByAppendingPathComponent("Constanst.plist")
        let path = (documentsDirectory as NSString).stringByAppendingPathComponent("Constanst.plist")
        
        let fileManager = NSFileManager.defaultManager()
        //check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("Constanst", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                do{
                    try fileManager.copyItemAtPath(bundlePath, toPath: path)}
                    
                catch let error1 as NSError {
                    print(error1)
                    return "" as! NSString
                }
                return "" as! NSString
            } else {
            }
        } else {
            // use this to delete file from documents directory
            //fileManager.removeItemAtPath(path, error: nil)
        }
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict {
            //loading values
            return dict.objectForKey(key)! as! NSString
            //...
        } else {
            print("WARNING: Couldn't create dictionary from GameData.plist! Default values will be used!")
            return "" as! NSString
        }
    }
    
    func saveData(key : NSString,value : NSString) {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("Constanst.plist")
        var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        //saving values
        dict.setObject(value, forKey: key)
        //...
        //writing to GameData.plist
        dict.writeToFile(path, atomically: false)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
    }
    
    
    
}
