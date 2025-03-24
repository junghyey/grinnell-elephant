//
//  ElephantUITests.swift
//  ElephantUITests
//
//  Created by 陸卉媫 on 2/16/25.
//

import XCTest

final class ElephantUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    // "Collectibles Shop" button navigation test
    func test1() throws {
        app.buttons["shopButton"].click()
    }
}
