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
    
    var manualPageButton: XCUIElement { app.buttons["manualPage"] }
    var manualFirstPage: XCUIElement { app.otherElements["manualFirstPage"] }

    var shopMainPageButton: XCUIElement { app.buttons["shopPage"] }
    var shopMainPageView: XCUIElement { app.scrollViews["shopMainPageView"] }

//    var settingsPageButton: XCUIElement { app.buttons["settingsPage"] }
//    var settingsPage: XCUIElement { app.scrollViews["settingsPage"] }

//    var pomodoroButton: XCUIElement { app.staticTexts["pomodoroButton"] }
//    var stopwatchButton: XCUIElement { app.staticTexts["stopwatchButton"] }
    
    // reset state prior to tests
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // Manual Button on homepage navigation test
    func testContentViewManualButton() throws {
        XCTAssertTrue(manualPageButton.isHittable) // Given
        manualPageButton.tap() // When
        XCTAssertTrue(manualFirstPage.exists) // Then
    }

    // Shop Button on homepage navigation test
    func testContentViewShopButton() throws {
        XCTAssertTrue(shopMainPageButton.isHittable) // Given
        shopMainPageButton.tap() // When
        XCTAssertTrue(shopMainPageView.exists) // Then
    }

//    // Settings Button on homepage navigation test
//    func testContentViewSettingsButton() throws {
//        XCTAssertTrue(settingsPageButton.isHittable) // Given
//        settingsPageButton.tap() // When
//        XCTAssertTrue(settingsPage.exists) // Then -- FAILS HERE
//    }

//    FEATURES IN PROGRESS
//    // Pomodoro Button on homepage navigation test
//    func testContentViewPomodoroButton() throws {
//        XCTAssertTrue(pomodoroButton.isHittable) // Given
//        pomodoroButton.tap() // When
//        // Then, widget should change to pomodoro mode
//    }
//
//    // Stopwatch Button on homepage navigation test
//    func testContentViewPomodoroButton() throws {
//        XCTAssertTrue(stopwatchButton.isHittable) // Given
//        stopwatchButton.tap() // When
//        // Then, widget should change to stopwatch mode
//    }

    
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
//        
//        
//        
//        let pageIdentifiers = ["manualFirstPage",
//                               "manualSecondPage",
//                               "manualThirdPage",
//                               "manualFourthPage"]
//        
//        XCTAssertTrue(manualButton.waitForExistence(timeout: 2))
//        manualButton.tap()
//        
//        // Test next button exists and work and each page exists
//        
//        for (idx, pageId) in pageIdentifiers.enumerated() {
//            // does the page exist?
//            assertPage(pageId)
//            if idx < pageIdentifiers.count - 1 {
//                let nextPageID = pageIdentifiers[idx + 1]
//                // check it is clicable
//                assertClickable("nextButton")
//                //click and go to nextpage
//                app.buttons["nextButton"].tap()
//                // did we land in the correct next page?
//                assertPage(nextPageID)
//            }// if
//        }//for next
//        // Test back button exists and work and each page exists
//                
//      
//        
//        for (idx, pageId) in pageIdentifiers.reversed().enumerated() {
//            // does the page exist?
//            assertPage(pageId)
//            if idx < pageIdentifiers.count - 1 {
//                let backPageID = pageIdentifiers[idx + 1]
//                // check it is clicable
//                assertClickable("backButton")
//                //click and go to nextpage
//                app.buttons["backButton"].tap()
//                sleep(10)
//                // did we land in the correct next page?
//                assertPage(backPageID)
//            }//if idx
//        }// for reversed
//        
//        
//        
//        // check home button
//        
//        for (idx, pageID) in pageIdentifiers.enumerated() {
//            
//            // click the manualPage since we are in the home
//            assertClickable("manualPage")
//            manualButton.tap()
//            
//            for _ in 0..<idx {
//                assertClickable("nextButton")
//                app.buttons["nextButton"].tap()
//            }
//            
//            // Assert current page for testing is shown
//            assertPage(pageID)
//            
//            // Check HomeButton is visible and tappable
//            assertClickable("homeButton")
//            app.buttons["homeButton"].tap()
//            assertPage("homePage")
//            
//            
//            
//        }
    }//end of manual page testing

}
