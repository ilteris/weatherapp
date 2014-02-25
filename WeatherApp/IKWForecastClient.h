//
//  IKWForecastClient.h
//  WeatherApp
//
//  Created by ilteris on 2/24/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <Foundation/Foundation.h>

@interface IKWForecastClient : AFHTTPSessionManager

+ (instancetype)sharedClient;


#pragma mark -
#pragma mark Forecast API
extern NSString * const IKWForecastAPIKey;



@end
