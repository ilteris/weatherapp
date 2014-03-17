//
//  IKWSyncObject.h
//  WeatherApp
//
//  Created by ilteris on 3/11/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKWSyncObject : NSObject

+ (IKWSyncObject *)sharedEngine;

- (void)startSync;


@property (atomic, assign, readonly) BOOL syncInProgress;

@end
