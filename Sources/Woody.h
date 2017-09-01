//
//  Woody.h
//  Woody
//
//  Created by Kaden Wilkinson on 9/1/17.
//  Copyright © 2017 Vivint.SmartHome. All rights reserved.
//

#ifndef Woody_h
#define Woody_h

#import "Woody-Swift.h"
@import Foundation;

#define NSLog(message, ...) [Woody logVerbose:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogVerbose(message, ...) [Woody logVerbose:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogDebug(message, ...) [Woody logDebug:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogInfo(message, ...) [Woody logInfo:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogWarning(message, ...) [Woody logWarning:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogError(message, ...) [Woody logError:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]


#endif /* Woody_h */
