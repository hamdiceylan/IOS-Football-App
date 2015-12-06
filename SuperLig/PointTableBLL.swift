//
//  PointTableBLL.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import Foundation
class PointTableBll{
    
    func GetPointTable() -> [PointTableObject]{
        let api = Api()
        let json  = api.makeHTTPRequest(HttpRequestType.GET, method: "TFF/GetActualList" , parameter: "" )
        print(json[0])
        
        var pointTableList = [PointTableObject]()
        for var i = 0; i<json.count;++i{
            
            let pointTableObject = PointTableObject()
            pointTableObject.Name = json[i]["Name"].string!
            pointTableObject.Game = json[i]["Game"].string!
            pointTableObject.Win = json[i]["Win"].string!
            pointTableObject.Lost = json[i]["Lost"].string!
            pointTableObject.Draw = json[i]["Draw"].string!
            pointTableObject.Plus = json[i]["Plus"].string!
            pointTableObject.Minus = json[i]["Minus"].string!
            pointTableObject.Average = json[i]["Average"].string!
            pointTableObject.Point = json[i]["Point"].string!

            pointTableList.append(pointTableObject)
        }
        return pointTableList
        
    }
    
    
}
