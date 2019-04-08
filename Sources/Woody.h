//
//  Woody.h
//  Woody
//
//  Created by Kaden Wilkinson on 9/1/17.
//  Copyright © 2019 Vivint.SmartHome. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef Woody_h
#define Woody_h

#define NSLog(message, ...) [Woody logVerbose:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogVerbose(message, ...) [Woody logVerbose:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogDebug(message, ...) [Woody logDebug:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogInfo(message, ...) [Woody logInfo:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogWarning(message, ...) [Woody logWarning:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]
#define WLogError(message, ...) [Woody logError:[NSString stringWithFormat: message, ##__VA_ARGS__] filepath:[NSString stringWithUTF8String:__FILE__] function:[NSString stringWithUTF8String:__FUNCTION__] line:__LINE__]


#endif /* Woody_h */


//! Project version number for Woody.
FOUNDATION_EXPORT double WoodyVersionNumber;

//! Project version string for Woody.
FOUNDATION_EXPORT const unsigned char WoodyVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Woody/PublicHeader.h>


