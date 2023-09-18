//
//  GamesOfPatternsTests.swift
//  GamesOfPatternsTests
//
//  Created by Sergey on 29.07.2023.
//

import XCTest
@testable import GamesOfPatterns

final class GamesOfPatternsTests: XCTestCase {
    
    var leonardoFactory: TurtleFactory!

    override func setUpWithError() throws {
        try super.setUpWithError()
        leonardoFactory = LeonardoFactory()
    }

    override func tearDownWithError() throws {
        leonardoFactory = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        let name = leonardoFactory.createName()
        let weapon = leonardoFactory.createWeaponName()
        
        XCTAssertEqual(name, "Leonardo")
        XCTAssertEqual(weapon, "Katana")
        
        XCTAssertNotEqual(name, "Mike")
        
        XCTAssert(weapon == "Katana")
    }

    func testPerformanceExample() throws {
        self.measure {
            _ = leonardoFactory.createName()
            _ = leonardoFactory.createWeaponName()
            _ = leonardoFactory.createImage()
        }
    }

}
