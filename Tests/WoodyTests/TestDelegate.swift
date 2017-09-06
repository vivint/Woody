//
//  TestDelegate.swift
//  Woody
//
//  Created by Kaden Wilkinson on 9/5/17.
//  Copyright © 2017 Vivint.SmartHome. All rights reserved.
//

import Woody


struct Log: Equatable {
    let message: String
    let filepath: String
    let function: String
    let line: Int

    static func ==(lhs: Log, rhs: Log) -> Bool {
        return lhs.message == rhs.message &&
            lhs.filepath == rhs.filepath &&
            lhs.function == rhs.function &&
            lhs.line == rhs.line
    }
}


class TestDelegate: WoodyDelegate {

    var verboseLogs = [Log]()
    var debugLogs = [Log]()
    var infoLogs = [Log]()
    var warningLogs = [Log]()
    var errorLogs = [Log]()


    func verbose(_ msg: String, filepath: String, function: String, line: Int) {
        verboseLogs.append(Log(message: msg, filepath: filepath, function: function, line: line))
    }

    func debug(_ msg: String, filepath: String, function: String, line: Int) {
        debugLogs.append(Log(message: msg, filepath: filepath, function: function, line: line))
    }

    func info(_ msg: String, filepath: String, function: String, line: Int) {
        infoLogs.append(Log(message: msg, filepath: filepath, function: function, line: line))
    }

    func warning(_ msg: String, filepath: String, function: String, line: Int) {
        warningLogs.append(Log(message: msg, filepath: filepath, function: function, line: line))
    }

    func error(_ msg: String, filepath: String, function: String, line: Int) {
        errorLogs.append(Log(message: msg, filepath: filepath, function: function, line: line))
    }
}
