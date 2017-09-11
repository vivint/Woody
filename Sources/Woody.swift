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
    @objc public static var delegate: WoodyDelegate?

    /// This is used when the delegate hasn't been set yet
    /// Keep internal for now until we know API is stable
    @objc static var defaultLogger: (String) -> Void = { message in
        NSLog(message)
    }

    @objc(logVerbose:filepath:function:line:)
    public static func verbose(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        guard let d = delegate else {
            defaultLogger("[VERBOSE] \(filename(from: filepath)).\(function): \(line) - \(message)")
            return
        }
        d.verbose?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logDebug:filepath:function:line:)
    public static func debug(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        guard let d = delegate else {
            defaultLogger("[DEBUG] \(filename(from: filepath)).\(function): \(line) - \(message)")
            return
        }
        d.debug?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logInfo:filepath:function:line:)
    public static func info(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        guard let d = delegate else {
            defaultLogger("[INFO] \(filename(from: filepath)).\(function): \(line) - \(message)")
            return
        }
        d.info?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logWarning:filepath:function:line:)
    public static func warning(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        guard let d = delegate else {
            defaultLogger("[WARNING] \(filename(from: filepath)).\(function): \(line) - \(message)")
            return
        }
        d.warning?(message, filepath: filepath, function: function, line: line)
    }

    @objc(logError:filepath:function:line:)
    public static func error(_ message: String, filepath: String = #file, function: String = #function, line: Int = #line) {
        guard let d = delegate else {
            defaultLogger("[ERROR] \(filename(from: filepath)).\(function): \(line) - \(message)")
            return
        }
        d.error?(message, filepath: filepath, function: function, line: line)
    }

    private static func filename(from path: String, extensionIncluded: Bool = false) -> String {
        let filename = (path as NSString).lastPathComponent
        if !extensionIncluded {
            let fileNameComponents = filename.components(separatedBy: ".")
            if let firstComponent = fileNameComponents.first {
                return firstComponent
            }
            return filename
        }
        return filename
    }
}
