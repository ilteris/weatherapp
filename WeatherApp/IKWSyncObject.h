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
- (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className;


@end
