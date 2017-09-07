# Woody

Woody is a micro logging framework with support for Swift & Objective-C that helps decouple which logging framework the end client (usually an app) would like to use.  For example you have multiple in house frameworks which are used across multiple different apps and you don't want to tie them all to a specific logging framework like [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) or [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver).  Woody allows you to not worry about which logging framework your app team wants to use when developing those in house frameworks and instead leaves that up to the end consumer of your framework.

## Usage

### Swift

```swift
import Woody

let log = Woody.self

log.verbose("Verbose message")
log.info("Info message")
log.debug("Debug message")
log.warning("Warning message")
log.error("Error message")
```

### Objective-C

```objc
@import Woody;

WLogVerbose(@"Verbose message");
WLogInfo(@"Info message");
WLogDebug(@"Debug message");
WLogWarning(@"Warning message");
WLogError(@"Error message");
```

## Setup

### Install

This library supports both Carthage and CocoaPods

#### CocoaPods

Add this line to your Podfile
```ruby
pod 'Woody'
```

#### Carthage

Add this line to your Cartfile
```
github "vivint/Woody" ~> 0.2.0
```

Below are two guides for use in either a framework or app target

### Frameworks

The easiest way to get started using Woody in a framework is to add a `Logging.swift` file like this:

```swift
import Foundation
import Woody

let log = Woody.self

// Mark these as deprecated to make sure we don't forget to use Woody logging
@available(*, deprecated, message: "Use logging utilities instead")
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.print(items, separator: separator, terminator: terminator)
}

@available(*, deprecated, message: "Use logging utilities instead")
func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.debugPrint(items, separator: separator, terminator: terminator)
}

@available(*, deprecated, message: "Use logging utilities instead")
func NSLog(_ format: String, _ args: CVarArg...) {
    Foundation.NSLog(format, args)
}
```

### Apps (iOS, tvOS, watchOS, macOS)


The easiest way to setup logging in an app is to add a `AppDelegate+Logging.swift` file and adding the following items:

This sets up an easy way to log throughout the app
```swift
import Woody

let log = Woody.self
```

I have found these useful to make sure other developers of the project are using the logging methods instead of any built in ones.
```swift
import Foundation


// Mark these as deprecated to make sure we don't forget to use logging in the app
@available(*, deprecated, message: "Use logging utilities instead")
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.print(items, separator: separator, terminator: terminator)
}

@available(*, deprecated, message: "Use logging utilities instead")
func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.debugPrint(items, separator: separator, terminator: terminator)
}

@available(*, deprecated, message: "Use logging utilities instead")
func NSLog(_ format: String, _ args: CVarArg...) {
    Foundation.NSLog(format, args)
}
```

You need to setup a delegate to get called whenever a log happens

```swift
class LoggingDelegate: WoodyDelegate {
    func verbose(_ msg: String, filepath: String, function: String, line: Int) {
	print("VERBOSE: \(filepath).\(function): \(line) - \(msg)")
    }

    func debug(_ msg: String, filepath: String, function: String, line: Int) {
	print("DEBUG: \(filepath).\(function): \(line) - \(msg)")
    }

    func info(_ msg: String, filepath: String, function: String, line: Int) {
	print("INFO: \(filepath).\(function): \(line) - \(msg)")
    }

    func warning(_ msg: String, filepath: String, function: String, line: Int) {
	print("WARNING: \(filepath).\(function): \(line) - \(msg)")
    }

    func error(_ msg: String, filepath: String, function: String, line: Int) {
	print("ERROR: \(filepath).\(function): \(line) - \(msg)")
    }
}
```

Extend the `AppDelegate` to add a method to setup logging

```swift
extension AppDelegate {
    func setupLogging() {
        log.delegate = LoggingDelegate()
    }
}
```

Last of all you need to call you new `setupLogging()` method in your `appDidFinishLaunching`.  (I would put it at the very top so you don't miss any logs when the app is launching)


### Using other logging providers

If you would like to forward the logs on to a different provider like [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) you can easily do that in your `WoodyDelegate`

```swift
import SwiftyBeaver


class LoggingDelegate: WoodyDelegate {
    func verbose(_ msg: String, filepath: String, function: String, line: Int) {
        SwiftyBeaver.verbose(msg, filepath, function, line: line)
    }

    func debug(_ msg: String, filepath: String, function: String, line: Int) {
        SwiftyBeaver.debug(msg, filepath, function, line: line)
    }

    func info(_ msg: String, filepath: String, function: String, line: Int) {
        SwiftyBeaver.info(msg, filepath, function, line: line)
    }

    func warning(_ msg: String, filepath: String, function: String, line: Int) {
        SwiftyBeaver.warning(msg, filepath, function, line: line)
    }

    func error(_ msg: String, filepath: String, function: String, line: Int) {
        SwiftyBeaver.error(msg, filepath, function, line: line)
    }
}
```

And then in your `setupLogging()` you can add some Destinations to SwiftyBeaver

```swift
extension AppDelegate {
    func setupLogging(logLevel: SwiftyBeaver.Level = .verbose) {
        log.delegate = LoggingDelegate()

        let console = ConsoleDestination()
        // use custom format and set console output to short time, log level & message
        console.format = "$C$L$c $N.$F:$l - $M"
        console.minLevel = logLevel
        SwiftyBeaver.addDestination(console)

        let cloud = SBPlatformDestination(appID: "APP_ID", appSecret: "SECRET", encryptionKey: "KEY")
        cloud.minLevel = logLevel
        SwiftyBeaver.addDestination(cloud)
    }
}
```

### Ideas

* Give the ability to users of Woody register themselves as Woody consumer and allow the end user to filter out logs for each framework that has registered.
* Possibly send logs to console by default if no `WoodyDelegate` is set.
