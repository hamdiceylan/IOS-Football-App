//
//  Api.swift
//  RmosDevremulkAnket
//
//  Created by RMOS on 25/11/15.
//  Copyright © 2015 RMOS. All rights reserved.
//

import Foundation


class Api : NSObject{
    
    let baseURL = "http://api.webron.social"
    
    //MARK: Perform a Authorization
    func makeHTTPRequest(requestType : HttpRequestType, method : NSString,parameter : NSString) -> JSON {
        let plistManager = PlistManager()
        
        let post:NSString = parameter
        let url:NSURL = NSURL(string: (baseURL as String) + "/" + (method as String))!
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        let postLength:NSString = String( postData.length )
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = requestType.rawValue;
        request.HTTPBody = postData
        //For Token Based Auth
        //request.setValue(plistManager.loadData("token") as String, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var reponseError: NSError?
        var response: NSURLResponse?
        var urlData: NSData?
        var jsonResult : JSON?
        
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
            
            let res = response as! NSHTTPURLResponse!;
            let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            var error: NSError?

            let jsonData:NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers )) as! NSDictionary
            
            
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(urlData!, options: .AllowFragments)   
                
                if json["isSucces"] as! Bool{
                    
                    let jsonData : NSString = json["Json"] as! NSString
                    let requestBodyData: NSData = jsonData.dataUsingEncoding(NSUTF8StringEncoding)!
                    
                    jsonResult  = JSON(data : requestBodyData)
                    
                    return jsonResult!
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
            return jsonResult!
            
            
        } catch let error as NSError {
            return jsonResult!
            //return error.localizedDescription
        }
    }
    
    
    //MARK: Perform a Authorization
    func makeHTTPAuthorization(username : NSString,password : NSString) -> NSString {
        
        
        let post:NSString = "username=\(username)&password=\(password)&grant_type=password"
        let url:NSURL = NSURL(string: (baseURL as String) + "/token")!
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        let postLength:NSString = String( postData.length )
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var reponseError: NSError?
        var response: NSURLResponse?
        var urlData: NSData?
        
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        
            
                let res = response as! NSHTTPURLResponse!;
            
                    let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    var error: NSError?
            
                    let jsonData:NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers )) as! NSDictionary
                    let token:NSString = jsonData.valueForKey("access_token") as! NSString
                    let tokenType : NSString = jsonData.valueForKey("token_type") as! NSString
            
                    return (tokenType as String) + " " + (token as String)
                    
            
            
        } catch let error as NSError {
            return error.localizedDescription
        }
    }
    
    
}
