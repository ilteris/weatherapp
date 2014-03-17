//
//  IKWSyncObject.m
//  WeatherApp
//
//  Created by ilteris on 3/11/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWSyncObject.h"
#import <Mantle/Mantle.h>

@implementation IKWSyncObject

+ (IKWSyncObject *)sharedEngine {
    static IKWSyncObject *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[IKWSyncObject alloc] init];
    });
    
    return sharedEngine;
}

- (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className
{
    NSParameterAssert(className);
    NSLog(@"collectionFromJSON is %@", JSON);
    
    if ([JSON isKindOfClass:[NSArray class]]) {
        
        NSLog(@"collectionFromJSON");
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(className)];
        NSArray *collection = [valueTransformer transformedValue:JSON];
        return collection;
        
    }
    return nil;
}



@end
