//
//  IKWHTTPClient.m
//  
//
//  Created by ilteris on 2/23/14.
//
//

#import "IKWHTTPClient.h"


#pragma mark -
#pragma mark Forecast API
NSString * const MTForecastAPIKey = @"51726905c23eeb21f6f875a028510da9";


@implementation IKWHTTPClient

+ (IKWHTTPClient *)sharedClient {
    static dispatch_once_t predicate;
    static MTForecastClient *_sharedClient = nil;
    
    dispatch_once(&predicate, ^{
        _sharedClient = [self alloc];
        _sharedClient = [_sharedClient initWithBaseURL:[self baseURL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        // Accept HTTP Header
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        
        // Register HTTP Operation Class
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

+ (NSURL *)baseURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/", MTForecastAPIKey]];
}

- (void)requestWeatherForCoordinate:(CLLocationCoordinate2D)coordinate completion:(IKWHTTPClientCompletionBlock)completion {
    NSString *path = [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
    [self getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id response) {
        if (completion) {
            completion(YES, response);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(NO, nil);
            
            NSLog(@"Unable to fetch weather data due to error %@ with user info %@.", error, error.userInfo);
        }
    }];
}



@end
