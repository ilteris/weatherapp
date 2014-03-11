//
//  IKWSyncObject.m
//  WeatherApp
//
//  Created by ilteris on 3/11/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWSyncObject.h"

@implementation IKWSyncObject

+ (IKWSyncObject *)sharedEngine {
    static IKWSyncObject *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[IKWSyncObject alloc] init];
    });
    
    return sharedEngine;
}



@end
