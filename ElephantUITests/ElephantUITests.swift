//
//  ElephantUITests.swift
//  ElephantUITests
//
//  Created by 陸卉媫 on 2/16/25.
//

import XCTest

final class ElephantUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var shopButton: XCUIElement { app.buttons["shopPage"] }
    var settingsButton: XCUIElement { app.buttons["settingsPage"]}
    var manualButton: XCUIElement { app.buttons["manualPage"]}
    
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
    }
    
    // ShopMainPageView tests
    func shopMainPageViewTest() throws {
        // TODO: add tests
    }
    
    // settingsView tests
    func settingsViewTest() throws {
        // TODO: add tests
    }
    
    // settingsView tests
    func settingsViewTest() throws {
        // TODO: add tests
    }

}
