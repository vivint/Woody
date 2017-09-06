//
//  WoodyTests.swift
//  Vivint.SmartHome
//
//  Created by Kaden Wilkinson on 9/1/17.
//  Copyright © 2017 Vivint.SmartHome. All rights reserved.
//

import Foundation
import XCTest
@testable import Woody

class WoodyTests: XCTestCase {
    var testDelegate: TestDelegate!

    override func setUp() {
        super.setUp()
        testDelegate = TestDelegate()
        Woody.delegate = testDelegate
    }

    override func tearDown() {
        testDelegate = nil
        super.tearDown()
    }

    func testVerboseLog() {
        Woody.verbose("Verbose")

        let log = Log(message: "Verbose", filepath: "\(currentDir())/WoodyTests.swift", function: "testVerboseLog()", line: 28)

        XCTAssert(testDelegate.verboseLogs.count == 1)
        XCTAssert(testDelegate.verboseLogs[0] == log)
    }

    func testDebugLog() {
        Woody.debug("Debug")

        let log = Log(message: "Debug", filepath: "\(currentDir())/WoodyTests.swift", function: "testDebugLog()", line: 37)

        XCTAssert(testDelegate.debugLogs.count == 1)
        XCTAssert(testDelegate.debugLogs[0] == log)
    }

    func testInfoLog() {
        Woody.info("Info")

        let log = Log(message: "Info", filepath: "\(currentDir())/WoodyTests.swift", function: "testInfoLog()", line: 46)

        XCTAssert(testDelegate.infoLogs.count == 1)
        XCTAssert(testDelegate.infoLogs[0] == log)
    }

    func testWarningLog() {
        Woody.warning("Warning")

        let log = Log(message: "Warning", filepath: "\(currentDir())/WoodyTests.swift", function: "testWarningLog()", line: 55)

        XCTAssert(testDelegate.warningLogs.count == 1)
        XCTAssert(testDelegate.warningLogs[0] == log)
    }

    func testErrorLog() {
        Woody.error("Error")

        let log = Log(message: "Error", filepath: "\(currentDir())/WoodyTests.swift", function: "testErrorLog()", line: 64)

        XCTAssert(testDelegate.errorLogs.count == 1)
        XCTAssert(testDelegate.errorLogs[0] == log)
    }
    
    static var allTests = [
        ("testVerboseLog", testVerboseLog),
        ("testDebugLog", testDebugLog),
        ("testInfoLog", testInfoLog),
        ("testWarningLog", testWarningLog),
        ("testErrorLog", testErrorLog),
    ]
}

private func stripFilename(from filepath: String) -> String {
    var paths = filepath.components(separatedBy: "/")
    paths.removeLast()
    return paths.joined(separator: "/")
}

private func currentDir() -> String {
    return stripFilename(from: #file)
}
