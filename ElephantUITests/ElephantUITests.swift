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
    func testContentView() throws {
        XCTAssertTrue(shopButton.isHittable)
        XCTAssertTrue(settingsButton.isHittable)
        XCTAssertTrue(manualButton.isHittable)
        XCTAssertTrue(pomodoroButton.isHittable)
        XCTAssertTrue(stopwatchButton.isHittable)
    }
    
    // ShopMainPageView tests
    func testShopMainPageView() throws {
        // TODO: add tests
    }
    
    // settingsView tests
    func testSettingsView() throws {
        // TODO: add tests
    }
    
    
    
    
    
    
    
    
    // for manual testing
    // is page shown?
    func assertPage(_ identifier: String) {
            let page = app.otherElements[identifier]
            XCTAssertTrue(page.waitForExistence(timeout: 2), "Expected Page \(identifier) Not Shown") //wait for
        }
    
    // is button clickable?
    func assertClickable(_ identifier: String) {
           let button = app.buttons[identifier]
            // check existence
           XCTAssertTrue(button.waitForExistence(timeout: 2), "Button \(identifier) Not Found")
            // check clicakble
           XCTAssertTrue(button.isHittable, "Button \(identifier) Not Clickable")
       }

    // manualView tests
    
    func testManualView() throws {
        
        
        
        let pageIdentifiers = ["manualFirstPage",
                               "manualSecondPage",
                               "manualThirdPage",
                               "manualFourthPage"]
        
        XCTAssertTrue(app.buttons["manualButton"].waitForExistence(timeout: 2))
        app.buttons["manualButton"].tap()
        
        // Test next button exists and work and each page exists
        
        for (idx, pageId) in pageIdentifiers.enumerated() {
            // does the page exist?
            assertPage(pageId)
            if idx < pageIdentifiers.count - 1 {
                let nextPageID = pageIdentifiers[idx + 1]
                // check it is clicable
                assertClickable("nextButton")
                //click and go to nextpage
                app.buttons["nextButton"].tap()
                // did we land in the correct next page?
                assertPage(nextPageID)
            }// if
        }//for next
        // Test back button exists and work and each page exists
        
        app.buttons["manualButton"].tap()
        
        for (idx, pageId) in pageIdentifiers.reversed().enumerated() {
            // does the page exist?
            assertPage(pageId)
            if idx < pageIdentifiers.count - 1 {
                let backPageID = pageIdentifiers[idx + 1]
                // check it is clicable
                assertClickable("backButton")
                //click and go to nextpage
                app.buttons["backButton"].tap()
                // did we land in the correct next page?
                assertPage(backPageID)
            }//if idx
        }// for reversed
        
        
        
        // check home button
        
        for (idx, pageID) in pageIdentifiers.enumerated() {
            
            // click the manualPage since we are in the home
            assertClickable("manualPage")
            app.buttons["manualPage"].tap()
            
            for _ in 0..<idx {
                assertClickable("nextbutton")
                app.buttons["NextButton"].tap()
            }
            
            // Assert current page for testing is shown
            assertPage(pageID)
            
            // Check HomeButton is visible and tappable
            assertClickable("homeButton")
            app.buttons["homeButton"].tap()
            assertPage("homePage")
            
            
            
        }
    }//end of manual page testing

}
