//
//  SkorerVC.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import UIKit

class SkorerVC: UIViewController {
    var scorerList = [ScorerObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scorerBLL = ScorerBll()
        scorerList = scorerBLL.GetScorer()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return scorerList.count
    }
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let scorerTable = scorerList[indexPath.row]
        let myCell = tableView.dequeueReusableCellWithIdentifier("scorerCell") as! ScorerTableCell
        myCell.lblName.text = (scorerTable.Name as String)
        myCell.lblTeam.text = (scorerTable.Team as String)
        myCell.lblScore.text = scorerTable.Score.stringValue

        
        return myCell
    }
    

}
