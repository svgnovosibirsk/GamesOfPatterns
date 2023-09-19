//
//  RaphaelTests.swift
//  GamesOfPatternsUITests
//
//  Created by Sergey on 19.09.2023.
//

import XCTest

final class RaphaelTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }

    func testRaphaelWeaponNameIsCorrect() throws {
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Abstract factory"]/*[[".cells.staticTexts[\"Abstract factory\"]",".staticTexts[\"Abstract factory\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.segmentedControls.buttons["Raph"].tap()
        
        let weaponTextScreenshot = app.staticTexts["Sai"].screenshot()
        let weaponTextScreenshotAttachment = XCTAttachment(screenshot: weaponTextScreenshot)
        weaponTextScreenshotAttachment.name = "WeaponTextScreenshotAttachment"
        weaponTextScreenshotAttachment.lifetime = .keepAlways
        add(weaponTextScreenshotAttachment)
        
        //let raphaelScreenScreenshot = app.screenshot()
        let raphaelScreenScreenshot = XCUIScreen.main.screenshot()
        let raphaelScreenScreenshotAttachment = XCTAttachment(screenshot: raphaelScreenScreenshot)
        raphaelScreenScreenshotAttachment.name = "RaphaelScreenScreenshotAttachment"
        raphaelScreenScreenshotAttachment.lifetime = .keepAlways
        add(raphaelScreenScreenshotAttachment)
        
        XCTAssert(app.staticTexts["Sai"].waitForExistence(timeout: 2))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
