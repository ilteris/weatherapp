//
//  IKWForecastClient+Weather.h
//  WeatherApp
//
//  Created by ilteris on 2/25/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWForecastClient.h"

@interface IKWForecastClient (Weather)

typedef void (^CRArrayCompletionBlock)(NSArray *collection, NSError *error);


- (NSURLSessionDataTask *)requestWeatherForCoordinateLatitude:(double)latitude
                                            longitude:(double)longitude
                                           completion:(CRArrayCompletionBlock)completion;

@end
