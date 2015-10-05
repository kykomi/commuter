//
//  TodayViewController.swift
//  widget
//
//  Created by 小宮山 司 on 2015/10/04.
//  Copyright © 2015年 Tsukasa K. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {

    @IBOutlet var firstLabel : UILabel!
    @IBOutlet var secondLabel : UILabel!
    @IBOutlet var thirdLabel : UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let size : CGSize = CGSizeMake(1, 120)
        self.preferredContentSize = size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        let _timeTable = self.loadData()
        _timeTable.load()
        let downTable = _timeTable.find(NSDate())
        self.firstLabel.text = formatString(downTable[0])
        self.secondLabel.text = formatString(downTable[1])
        self.thirdLabel.text = formatString(downTable[2])
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    //private methods
    func loadData() -> TimeTable {
        let _timeTable = TimeTable()
        _timeTable.load()
        return _timeTable
    }
    
    func formatString(target : String) -> String {
        return target.substringToIndex(target.startIndex.advancedBy(2)) + ":" + target.substringFromIndex(target.startIndex.advancedBy(2))
        
    }
    
}
