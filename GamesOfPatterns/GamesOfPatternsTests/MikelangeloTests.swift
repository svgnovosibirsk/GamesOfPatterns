//
//  MikelangeloTests.swift
//  GamesOfPatternsTests
//
//  Created by Sergey on 18.09.2023.
//

import XCTest
@testable import GamesOfPatterns

final class MikelangeloTests: XCTestCase {
    
    var mikelangeloFactory: MichelangeloFactory!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mikelangeloFactory = MichelangeloFactory()
    }

    override func tearDownWithError() throws {
        mikelangeloFactory = nil
        try super.tearDownWithError()
    }

    func testName() throws {
        let name = mikelangeloFactory.createName()
        XCTAssert( name == "Michelangelo")
        XCTAssertEqual(name, "Michelangelo", "The name must be: Michelangelo")
        XCTAssertNotEqual(name, "Leo")
    }
    
    func testWeapon() throws {
        let weapon = mikelangeloFactory.createWeaponName()
        XCTAssert( weapon == "Nunchaku")
        XCTAssertEqual(weapon, "Nunchaku", "The weapon must be: Nunchaku")
        XCTAssertNotEqual(weapon, "Sai")
    }

    func testPerformanceExample() throws {
        self.measure {
            _ = mikelangeloFactory.createImage()
        }
        
//        measure(
//                  metrics: [
//                    XCTClockMetric(),
//                    XCTCPUMetric(),
//                    XCTStorageMetric(),
//                    XCTMemoryMetric()
//                  ]
//                ) {
//                    _ = mikelangeloFactory.createImage()
//              }
    }
}
