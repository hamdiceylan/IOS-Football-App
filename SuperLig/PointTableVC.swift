//
//  PointTableVC.swift
//  SuperLig
//
//  Created by Hamdi Ceylan on 6.12.2015.
//  Copyright © 2015 Hamdi Ceylan. All rights reserved.
//

import UIKit

class PointTableVC: UIViewController {
    
    var poitnTableList = [PointTableObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pointTableBLL = PointTableBll()
        poitnTableList = pointTableBLL.GetPointTable()
        print(poitnTableList)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return poitnTableList.count
    }
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let pointTable = poitnTableList[indexPath.row]
        let myCell = tableView.dequeueReusableCellWithIdentifier("pointTableCell") as! PointTableCell
        myCell.lblName.text = (pointTable.Name as String)
        myCell.lblGame.text = (pointTable.Game as String)
        myCell.lblWin.text = (pointTable.Win as String)
        myCell.lblDraw.text = (pointTable.Draw as String)
        myCell.lblLost.text = (pointTable.Lost as String)
        myCell.lblAv.text = (pointTable.Average as String)
        myCell.lblPoint.text = (pointTable.Point as String)

        return myCell
    }

}
