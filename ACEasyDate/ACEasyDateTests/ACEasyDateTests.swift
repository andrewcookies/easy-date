//
//  ACEasyDateTests.swift
//  ACEasyDateTests
//
//  Created by Andrea Colussi on 14/04/22.
//

import XCTest
@testable import ACEasyDate

class ACEasyDateTests: XCTestCase {
    
    let daySeconds = 86400
    let dayMillis = 86400000
    
    var acEasyDate : ACEasyDate!

    override func setUpWithError() throws {
        acEasyDate = ACEasyDate()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testFunc() throws {
        
        //comparison
        let todayEpoch = Int(Date().timeIntervalSince1970)
        let yesterdayEpoch = todayEpoch - daySeconds
        let tomorrowEpoch = todayEpoch + daySeconds

        let todayMillis = todayEpoch*1000
        let yesterdayMillis = todayMillis - dayMillis
        let tomorrowMillis = todayMillis + dayMillis
        
        
        let sdEpoch = ACEasyDate(epoch: todayEpoch)
        let sdMillis = ACEasyDate(timeMillis: todayMillis)
        
    
        XCTAssertTrue(sdEpoch.isAfter(yesterdayEpoch))
        XCTAssertTrue(sdMillis.isAfterMillis(yesterdayMillis))
        
        XCTAssertFalse(sdEpoch.isBefore(yesterdayEpoch))
        XCTAssertFalse(sdMillis.isBeforeMillis(yesterdayMillis))
        
        XCTAssertFalse(sdEpoch.isAfter(tomorrowEpoch))
        XCTAssertFalse(sdMillis.isAfterMillis(tomorrowMillis))
        
        XCTAssertTrue(sdEpoch.isAfter(ACEasyDate(epoch: yesterdayEpoch)))
        XCTAssertTrue(sdMillis.isAfter(ACEasyDate(timeMillis: yesterdayMillis)))
    
        
        
        //parsing and string
        let sd = ACEasyDate(date: "10/04/2022", format: "dd/MM/yyyy")
        let sdExample = ACEasyDate(epoch: 1649585563) //10/04/2022
        
        XCTAssertTrue(sd.isSameDay(sdExample))
        
        sd.acEasyDateformat = "yy/MM/dd"
        XCTAssertEqual(sd.dateString, "22/04/10")
        
        
        //Timezone
        let sdCurrent = ACEasyDate()
        let sdTimezone = ACEasyDate().convertFromCurrentTimeZone(to: TimeZone(secondsFromGMT: 21600) ?? TimeZone.current)

        
    }

    

}
