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
    func testShopMainPageView() throws {
        // move to shop main page
        app.buttons["shopPage"].tap()
        
        // extract all shop buttons
        let shopButtons = app.buttons.allElementsBoundByIndex.filter {
                $0.identifier.hasPrefix("shopButton_")
        }
        
        // test if each button is hittable
        for button in shopButtons {
            XCTAssertTrue(button.isHittable, "Shop button \(button.identifier) not hittable")
        }
    }
    
    // tests each button in each button view
    func testItemView() throws {
        
        // move to shop main page
        app.buttons["shopPage"].tap()
        
        // extract all shop buttons
        let shopButtons = app.buttons.allElementsBoundByIndex.filter {
                $0.identifier.hasPrefix("shopButton_")
        }
        
        // navigate to each item view
        for shopButton in shopButtons {
            
            // skip the back button
            if (shopButton.identifier.hasPrefix("shopButton_back")) {
                continue
            }
            
            // else click to get to item view
            shopButton.tap()
            
            // extract all item buttons
            let itemButtons = app.buttons.allElementsBoundByIndex.filter {
                    $0.identifier.hasPrefix("itemButton_")
            }
            
            // save back button
            let backButton = app.buttons.allElementsBoundByIndex.filter {
                $0.identifier.hasPrefix("itemButton_back_")
            }.first
            
            // see if each button is hittable
            for button in itemButtons {
                XCTAssertTrue(button.isHittable, "Item button \(button.identifier) not hittable")
            }
            
            // move back to shop page
            backButton!.tap()
        }
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
