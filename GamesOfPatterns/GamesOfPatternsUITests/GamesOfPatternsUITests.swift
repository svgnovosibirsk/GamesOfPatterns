//
//  GamesOfPatternsUITests.swift
//  GamesOfPatternsUITests
//
//  Created by Sergey on 29.07.2023.
//

import XCTest

final class GamesOfPatternsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Abstract factory"]/*[[".cells.staticTexts[\"Abstract factory\"]",".staticTexts[\"Abstract factory\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Leo"]/*[[".segmentedControls.buttons[\"Leo\"]",".buttons[\"Leo\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.staticTexts["Katana"].waitForExistence(timeout: 2))
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
