//
//  Woody.swift
//  Vivint.SmartHome
//
//  Created by Kaden Wilkinson on 9/1/17.
//  Copyright © 2017 Vivint.SmartHome. All rights reserved.
//

import Foundation


@objc public protocol WoodyDelegate: class {
    @objc optional func verbose(_ msg: String, filepath: String, function: String, line: Int)
    @objc optional func debug(_ msg: String, filepath: String, function: String, line: Int)
    @objc optional func info(_ msg: String, filepath: String, function: String, line: Int)
    @objc optional func warning(_ msg: String, filepath: String, function: String, line: Int)
    @objc optional func error(_ msg: String, filepath: String, function: String, line: Int)
}

@objc public class Woody: NSObject {
    @objc public enum Level: Int {
        case verbose
        case debug
        case info
        case warning
        case error
    }

    /// This should never be set by a framework
    public static var delegate: WoodyDelegate?

    @objc(logVerbose:filepath:function:line:)
    public static func verbose(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        delegate?.verbose?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logDebug:filepath:function:line:)
    public static func debug(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        delegate?.debug?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logInfo:filepath:function:line:)
    public static func info(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        delegate?.info?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logWarning:filepath:function:line:)
    public static func warning(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        delegate?.warning?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logError:filepath:function:line:)
    public static func error(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        delegate?.error?(message, filepath: filepath, function: function, line: line)
    }
}
