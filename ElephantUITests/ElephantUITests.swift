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
    
    

}
