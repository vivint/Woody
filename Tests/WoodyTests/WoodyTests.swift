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

        XCTAssertEqual(testDelegate.verboseLogs.count, 1)
        XCTAssertEqual(testDelegate.verboseLogs[0], log)
    }

    func testDebugLog() {
        Woody.debug("Debug")

        let log = Log(message: "Debug", filepath: "\(currentDir())/WoodyTests.swift", function: "testDebugLog()", line: 37)

        XCTAssertEqual(testDelegate.debugLogs.count, 1)
        XCTAssertEqual(testDelegate.debugLogs[0], log)
    }

    func testInfoLog() {
        Woody.info("Info")

        let log = Log(message: "Info", filepath: "\(currentDir())/WoodyTests.swift", function: "testInfoLog()", line: 46)

        XCTAssertEqual(testDelegate.infoLogs.count, 1)
        XCTAssertEqual(testDelegate.infoLogs[0], log)
    }

    func testWarningLog() {
        Woody.warning("Warning")

        let log = Log(message: "Warning", filepath: "\(currentDir())/WoodyTests.swift", function: "testWarningLog()", line: 55)

        XCTAssertEqual(testDelegate.warningLogs.count, 1)
        XCTAssertEqual(testDelegate.warningLogs[0], log)
    }

    func testErrorLog() {
        Woody.error("Error")

        let log = Log(message: "Error", filepath: "\(currentDir())/WoodyTests.swift", function: "testErrorLog()", line: 64)

        XCTAssertEqual(testDelegate.errorLogs.count, 1)
        XCTAssertEqual(testDelegate.errorLogs[0], log)
    }

    func testMissingDelegate() {
        var loggedMessage = ""
        func defaultLogger(_ message: String) {
            loggedMessage = message
        }

        Woody.delegate = nil
        Woody.defaultLogger = defaultLogger

        Woody.verbose("Verbose")
        XCTAssertEqual(loggedMessage, "[VERBOSE] WoodyTests.testMissingDelegate(): 81 - Verbose")

        Woody.debug("Debug")
        XCTAssertEqual(loggedMessage, "[DEBUG] WoodyTests.testMissingDelegate(): 84 - Debug")

        Woody.info("Info")
        XCTAssertEqual(loggedMessage, "[INFO] WoodyTests.testMissingDelegate(): 87 - Info")

        Woody.warning("Warning")
        XCTAssertEqual(loggedMessage, "[WARNING] WoodyTests.testMissingDelegate(): 90 - Warning")

        Woody.error("Error")
        XCTAssertEqual(loggedMessage, "[ERROR] WoodyTests.testMissingDelegate(): 93 - Error")
    }
    
    static var allTests = [
        ("testVerboseLog", testVerboseLog),
        ("testDebugLog", testDebugLog),
        ("testInfoLog", testInfoLog),
        ("testWarningLog", testWarningLog),
        ("testErrorLog", testErrorLog),
        ("testMissingDelegate", testMissingDelegate),
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
