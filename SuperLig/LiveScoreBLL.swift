//
//  LiveScoreBLL.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import Foundation
class LiveScoreBll{
    func GetLiveScore() -> [LiveScoreObject]{
        let api = Api()
        let json  = api.makeHTTPRequest(HttpRequestType.GET, method: "TFF/LiveScore/1" , parameter: "" )
        var liveScoreList = [LiveScoreObject]()
        for var i = 0; i<json.count;++i{
            let  liveScoreObject = LiveScoreObject()
            liveScoreObject.Code = json[i]["Code"].string!
            liveScoreObject.Minute = json[i]["Minute"].string!
            liveScoreObject.HomeTeam = json[i]["HomeTeam"].string!
            liveScoreObject.Score = json[i]["Score"].string!
            liveScoreObject.DisplacementTeam = json[i]["DisplacementTeam"].string!
            liveScoreList.append(liveScoreObject)
        }
        return liveScoreList
    }
}