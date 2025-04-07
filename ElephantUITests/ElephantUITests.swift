//
//  ElephantUITests.swift
//  ElephantUITests
//
//  Created by 陸卉媫 on 2/16/25.
//

// testing:
//      product -> scheme
//                  --> if some form of UI test is there, run test
//                  --> if not, new scheme -> target: ElephantUItest

import XCTest

final class ElephantUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var shopButton: XCUIElement { app.buttons["shopPage"] }
    var settingsButton: XCUIElement { app.buttons["settingsPage"] }
    var manualButton: XCUIElement { app.buttons["manualPage"] }
    var pomodoroButton: XCUIElement { app.staticTexts["pomodoroButton"] }
    var stopwatchButton: XCUIElement { app.staticTexts["stopwatchButton"] }
    
    // reset state prior to tests
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // Homepage buttons navigation test
    func contentViewTest() throws {
        XCTAssertTrue(shopButton.isHittable)
        XCTAssertTrue(settingsButton.isHittable)
        XCTAssertTrue(manualButton.isHittable)
        XCTAssertTrue(pomodoroButton.isHittable)
        XCTAssertTrue(stopwatchButton.isHittable)
    }
    
    // ShopMainPageView tests
    func shopMainPageViewTest() throws {
        // TODO: add tests
    }
    
    // settingsView tests
    func settingsViewTest() throws {
        // TODO: add tests
    }
    
    // manualView tests
    func manualViewTest() throws {
        // TODO: add tests
    }

}
