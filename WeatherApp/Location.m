//
//  Location.m
//  WeatherApp
//
//  Created by ilteris on 3/15/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "Location.h"


@implementation Location


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"name" : @"name",
             @"latitude" : @"latitude",
             @"longitude" : @"longitude",
             @"offset": @"offset",
             @"timezone" : @"timezone"
            };
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, ID: %@, name: %@>", NSStringFromClass([self class]), self, self.timezone, self.name];
}

@end
