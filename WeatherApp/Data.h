//
//  Data.h
//  WeatherApp
//
//  Created by ilteris on 3/24/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Data : NSManagedObject

@property (nonatomic) float apparentTemperature;
@property (nonatomic) float cloudCover;
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
@property (nonatomic) float visibility;
@property (nonatomic) float windBearing;
@property (nonatomic) float windSpeed;
@property (nonatomic, retain) NSString * precipType;
@property (nonatomic) int64_t sunriseTime;
@property (nonatomic) int64_t sunsetTime;
@property (nonatomic) float moonPhase;
@property (nonatomic) float precipIntensityMax;
@property (nonatomic) int64_t precipIntensityMaxTime;
@property (nonatomic) float precipAccumulation;
@property (nonatomic) float temperatureMin;
@property (nonatomic) int64_t temperatureMinTime;
@property (nonatomic) float temperatureMax;
@property (nonatomic) int64_t temperatureMaxTime;
@property (nonatomic) int64_t apparentTemperatureMaxTime;
@property (nonatomic) int16_t nearestStormDistance;
@property (nonatomic) float nearestStormBearing;
@property (nonatomic) int64_t apparentTemperatureMinTime;
@property (nonatomic) float apparentTemperatureMin;
@property (nonatomic) float apparentTemperatureMax;
@property (nonatomic, retain) Location *location;

@end
