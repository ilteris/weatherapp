//
//  Location.h
//  WeatherApp
//
//  Created by ilteris on 3/15/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface Location : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSNumber *latitude;
@property (nonatomic, copy, readonly) NSNumber *longitude;
@property (nonatomic, copy, readonly) NSString *offset;
@property (nonatomic, copy, readonly) NSNumber *timezone;




@end
