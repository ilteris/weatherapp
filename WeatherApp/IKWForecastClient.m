//
//  IKWForecastClient.m
//  WeatherApp
//
//  Created by ilteris on 2/24/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWForecastClient.h"


#pragma mark -
#pragma mark Forecast API
NSString * const IKWForecastAPIKey = @"51726905c23eeb21f6f875a028510da9";



@implementation IKWForecastClient

+ (instancetype)sharedClient {
    static IKWForecastClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[IKWForecastClient alloc] initWithBaseURL:[NSURL URLWithString:[self baseURL]]];
      //  _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    });
    
    return _sharedClient;
}




+ (NSString *)baseURL {
    return [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/", IKWForecastAPIKey];
}



@end
