//
//  TimeTableTest.swift
//  commuter
//
//  Created by 小宮山 司 on 2015/10/25.
//  Copyright © 2015年 Tsukasa K. All rights reserved.
//

import XCTest

class TimeTableTest: XCTestCase {
    
    var t : TimeTable?
    override func setUp() {
        super.setUp()
        t = TimeTable()
        t?.load()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFind_expired_tran() {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja")
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = formatter.dateFromString("2015-01-01 23:59")
        let actual = t?.find(date!)
        XCTAssertEqual(3, actual?.count)
    }
    
    func testPerformanceExample() {
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
