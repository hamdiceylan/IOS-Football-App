//
//  LiveScoreVC.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import UIKit

class LiveScoreVC: UIViewController {

    var liveScoreList = [LiveScoreObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let liveScorerBLL = LiveScoreBll()
        liveScoreList = liveScorerBLL.GetLiveScore()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return liveScoreList.count
    }
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let liveScoreTable = liveScoreList[indexPath.row]
        let myCell = tableView.dequeueReusableCellWithIdentifier("liveScoreCell") as! LiveScoreTableCell
        myCell.lblMinute.text = (liveScoreTable.Minute as String)
        myCell.lblHomeTeam.text = (liveScoreTable.HomeTeam as String)
        myCell.lblScore.text = (liveScoreTable.Score as String)
        myCell.lblDisplacementTeam.text = (liveScoreTable.DisplacementTeam as String)
        
        return myCell
    }
}
