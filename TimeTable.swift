//
//  TimeTable.swift
//  commuter
//
//  Created by 小宮山 司 on 2015/10/04.
//  Copyright © 2015年 Tsukasa K. All rights reserved.
//

import Foundation

class TimeTable{
    
    private var downTrains : [String]
    
    init(){
        self.downTrains = [String]()
    }
    
    func load(){
        self.downTrains = self.loadDownTrains()
    }
    
    func find(baseDate : NSDate) -> [String]{
        var result = [String]()

        //とりあえず下りの直近の3件
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HHmm"
        formatter.timeZone = NSTimeZone(abbreviation: "JST")
        let baseDateString = formatter.stringFromDate(baseDate)
        
        for timeString in self.downTrains {
            if (baseDateString.compare(timeString) == NSComparisonResult.OrderedAscending){
                result.append(timeString)
            }
            
            if (result.count >= 3)
            {
                break
            }
        }
        while(result.count <= 3)
        {
            result.append("----")
        }
        return result
    }
    
    private func loadDownTrains() -> [String]{
        //todo API
        var downTrains : [String] = [String]()

        downTrains.append("0745")
        downTrains.append("0759")
        downTrains.append("0815")
        downTrains.append("0830")
        downTrains.append("0845")
        downTrains.append("0901")
        downTrains.append("0958")
        downTrains.append("1704")
        downTrains.append("1719")
        downTrains.append("1734")
        downTrains.append("1749")
        downTrains.append("1804")
        downTrains.append("1819")
        downTrains.append("1834")
        downTrains.append("1849")
        downTrains.append("1904")
        downTrains.append("1919")
        downTrains.append("1934")
        downTrains.append("1949")
        downTrains.append("2004")
        downTrains.append("2019")
        downTrains.append("2034")
        downTrains.append("2049")
        downTrains.append("2104")
        downTrains.append("2119")
        downTrains.append("2134")
        downTrains.append("2149")
        downTrains.append("2204")
        downTrains.append("2219")
        downTrains.append("2234")
        downTrains.append("2249")
        downTrains.append("2304")
        downTrains.append("2319")
        return downTrains
    }
}
