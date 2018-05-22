//
//  AWSDevice
//
//  Created by Justin Greenfield on 8/23/16.
//  Copyright © 2016 Weather Decision Technologies, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE 
#import <UIKit/UIKit.h>
#define AWSDevice UIDevice
#else

@interface AWSDevice : NSObject

+ (instancetype) currentDevice;

@property (nonatomic, readonly) NSString* systemName;
@property (nonatomic, readonly) NSString* systemVersion;
@property (nonatomic, readonly) NSString* model;
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSUUID* identifierForVendor;

@end

#endif
