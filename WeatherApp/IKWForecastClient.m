//
//  IKWForecastClient.m
//  WeatherApp
//
//  Created by ilteris on 2/24/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWForecastClient.h"

@interface IKWForecastClient()
+ (NSURL *)baseURL;
@end




@implementation IKWForecastClient

#pragma mark -
#pragma mark Forecast API
NSString * const IKWForecastAPIKey = @"51726905c23eeb21f6f875a028510da9";



#pragma mark - Class Methods


+ (instancetype)sharedClient
{
    static dispatch_once_t onceQueue;
    static IKWForecastClient *__sharedClient = nil;
    dispatch_once(&onceQueue, ^{
        __sharedClient = [[self alloc] init];
    });
    return __sharedClient;
}


- (id)init
{
    if (self = [super initWithBaseURL:[[self class] baseURL]])
    {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
       
    }
    
    return self;
}



+ (NSURL *)baseURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/", IKWForecastAPIKey]];
}



@end
