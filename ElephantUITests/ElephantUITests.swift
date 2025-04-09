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
        settingsButton.tap()//moves to SettingsView page
        
        /* let definitions for each buttons on Settings View -
        Back Button (bb), Light/Dark Mode button (modeB),
         Theme Buttons (themeB), and the Customizable list button (customB):
                                            and the Save and Cancel buttons within the customizable list pop-up */
        let bb = app.buttons["Back"]// Name of Back button that navigates back to Content View
        let modeB = app.buttons["Light Mode"].firstMatch //default is set to Light mode so we get the first display
        let themeB = ["Default","BW","Benny"]//will implement loop through each theme option below
        let customB = app.buttons["Add new custom list"] //Name of customizable list button
        let saveB = app.buttons["Save"] //Save button in customizable checklist sheet pop-up
        let cancelB = app.buttons["Cancel"] // Cancel button in customizable checklist sheet pop-up
        
        //Back button test
        XCTAssertTrue(bb.isHittable, "Back button should hit")
        bb.tap() //taps back button to navigate to Homepage
        XCTAssertTrue(app.buttons["settingsPage"].isHittable, "Returns to Settings after hitting Back button")
        //should navigate back to settings^
        
        //Mode buttons test
        XCTAssertTrue(modeB.isHittable, "Mode button should be hittable and switch between light/dark mode")
        modeB.tap()//taps mode button to switch between Light/Dark mode
        XCTAssertTrue(modeB.isHittable, "Mode button should switch to the opposite mode")
        
        //Theme buttons test
        for theme in themeB{ //for loop for all current themes
            let tb = app.buttons[theme]//moves between each theme
            XCTAssertTrue(tb.isHittable, "\(theme) theme button should be hit")
            tb.tap()//taps that current theme button
            XCTAssertTrue(tb.isSelected, "\(theme) theme button should be selected and change page view")
            //Once hit, the theme should change the layout/background of the current page
            //still need to implement tests for changing the theme for all currently working app pages!
        }
        
        //Customizable List button test
        XCTAssertTrue(customB.isHittable, "Add new custom list button is hittable")
        customB.tap()//taps custom list button
        
        //-> Now we check if the checklist appears in settings
        let checklistSheet = app.otherElements["CheckListView"]//navigates to where checklist sheet is defined in CheckListView
        XCTAssertTrue(checklistSheet.waitForExistence(timeout: 3), "Checklist pop-up sheet should appear")//times 3 seconds to get pop-up
        
        //Save button within checklist sheet test
        XCTAssertTrue(saveB.isHittable, "Save button is hit within Checklist Sheet")//should only work if checklistSheet was hittable
        saveB.tap() //taps save button
        
        customB.tap()//goes back to pop-up after hitting save
        
        //Cancel button within checklist sheet test
        XCTAssertTrue(cancelB.isHittable, "Cancel button is hit within Checklist Sheet")//should only work if previous tests did
        cancelB.tap()//taps cancel button and navigates back to settings page, closing the pop-up sheet
    }//end of SettingsView tests

    
    
    
    
    
    
    
    
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
