//
//  IKWHTTPClient.h
//  
//
//  Created by ilteris on 2/23/14.
//
//

#import <UIKit/UIKit.h>
#import "AFHTTPClient.h"

typedef void (^IKWHTTPClientCompletionBlock)(BOOL success, NSDictionary *response);


@interface IKWHTTPClient : AFHTTPClient

#pragma mark -
#pragma mark Shared Client

+ (IKWHTTPClient *)sharedClient;


#pragma mark -
#pragma mark Instance Methods
- (void)requestWeatherForCoordinate:(CLLocationCoordinate2D)coordinate completion:(IKWHTTPClientCompletionBlock)completion;


#pragma mark -
#pragma mark Forecast API
extern NSString * const MTForecastAPIKey;


@end
