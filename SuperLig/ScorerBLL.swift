//
//  ScorerBLL.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import Foundation
class ScorerBll{
    func GetScorer() -> [ScorerObject]{
        let api = Api()
        let json  = api.makeHTTPRequest(HttpRequestType.GET, method: "TFF/GetScorers" , parameter: "" )
        var scorerList = [ScorerObject]()
        for var i = 0; i<json.count;++i{
            let  scorerObject = ScorerObject()
            scorerObject.Name = json[i]["Name"].string!
            scorerObject.Team = json[i]["Team"].string!
            scorerObject.Score = json[i]["Score"].int!
            print(json[i])
            scorerList.append(scorerObject)
        }
        return scorerList
    }
}