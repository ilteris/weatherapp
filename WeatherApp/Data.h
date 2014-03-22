//
//  Data.h
//  WeatherApp
//
//  Created by ilteris on 3/22/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Data : NSManagedObject

@property (nonatomic) float apparentTemperature;
@property (nonatomic) float cloudCover;
@property (nonatomic) NSTimeInterval createdAt;
@property (nonatomic) float dewPoint;
@property (nonatomic) float humidity;
@property (nonatomic, retain) NSString * icon;
@property (nonatomic) float ozone;
@property (nonatomic) float precipIntensity;
@property (nonatomic) float precipProbability;
@property (nonatomic) float pressure;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic) float temperature;
@property (nonatomic) int64_t time;
@property (nonatomic, retain) NSString * timeFrame;
@property (nonatomic) float windBearing;
@property (nonatomic) float windSpeed;
@property (nonatomic, retain) Location *location;

@end
