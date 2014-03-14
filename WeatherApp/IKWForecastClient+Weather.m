//
//  IKWForecastClient+Weather.m
//  WeatherApp
//
//  Created by ilteris on 2/25/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWForecastClient+Weather.h"
#import "IKWSyncObject.h"
#import "Location.h"

@implementation IKWForecastClient (Weather)

- (NSURLSessionDataTask *)requestWeatherForCoordinateLatitude:(double)latitude
                                            longitude:(double)longitude
                                           completion:(CRArrayCompletionBlock)completion
{
    NSParameterAssert(latitude);
    NSParameterAssert(longitude);
    
    NSDictionary *parameters = @{
                                 @"units" : @"si"
                                 };
    NSString *path = [NSString stringWithFormat:@"%f,%f", latitude, longitude];
    
    NSString *URLString = [[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString];
    NSLog(@"URLstring is %@", URLString);
    
    return [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (!completion) {
            return;
        }
        
        if (responseObject) {
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSLog(@"responseObject is %@", responseObject);
                
                id collection = [[IKWSyncObject sharedEngine] collectionFromJSON:responseObject className:NSStringFromClass([Location class])];
                
               // dispatch_async(dispatch_get_main_queue(), ^{ completion(collection, nil); });
                
            });
            
        } else {
            completion(nil, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (completion) {
            completion(nil, error);
        }
        
    }];
}
@end
