//
//  IKWSyncObject.m
//  WeatherApp
//
//  Created by ilteris on 3/11/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWSyncObject.h"
#import <Mantle/Mantle.h>
#import "SDCoreDataController.h"
#import "INTULocationManager.h"
#import "IKWForecastClient+Weather.h"


NSString * const kIKWSyncObjectInitialCompleteKey               = @"IKWSyncObjectInitialSyncCompleted";
NSString * const kIKWSyncObjectSyncCompletedNotificationName    = @"IKWSyncObjectSyncCompleted";

@interface IKWSyncObject ()
@property (atomic, assign, readwrite) BOOL syncInProgress;

@property (assign, nonatomic) NSInteger locationRequestID;
@property (assign, nonatomic) INTULocationAccuracy desiredAccuracy;
@property (assign, nonatomic) NSTimeInterval timeout;

@end

@implementation IKWSyncObject

+ (IKWSyncObject *)sharedEngine {
    static IKWSyncObject *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[IKWSyncObject alloc] init];
    });
    
    return sharedEngine;
}


- (void)startSync {
    //check the time difference here.
    //if time difference between last check and now is > 1 hour  or previous location is 50km different from current location send the new request, otherwise dont start sync.
    self.desiredAccuracy = INTULocationAccuracyCity;
    self.timeout = 10.0;
    
    self.locationRequestID = NSNotFound;
    
    [self startLocationRequest];

    
    if (!self.syncInProgress) {
        [self willChangeValueForKey:@"syncInProgress"];
        _syncInProgress = YES;
        [self didChangeValueForKey:@"syncInProgress"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            [self downloadDataForRegisteredObjects:YES];
        });
    }
}




- (void)startLocationRequest
{
    __weak __typeof(self) weakSelf = self;
    
    INTULocationManager *locMgr = [INTULocationManager sharedInstance];
    self.locationRequestID = [locMgr requestLocationWithDesiredAccuracy:self.desiredAccuracy
                                                                timeout:self.timeout
                                                                  block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                                                      __typeof(weakSelf) strongSelf = weakSelf;
                                                                      
                                                                      if (status == INTULocationStatusSuccess) {
                                                                          // achievedAccuracy is at least the desired accuracy (potentially better)
                                                                          NSLog(@"Location request successful! Current Location:\n%@", currentLocation);
                                                                          
                                                                          CLLocationCoordinate2D coord;
                                                                          coord.longitude = currentLocation.coordinate.longitude;
                                                                          coord.latitude = currentLocation.coordinate.latitude;
                                                                          
                                                                          
                                                                          [[IKWForecastClient sharedClient] requestWeatherForCoordinateLatitude:coord.latitude longitude:coord.longitude completion:^(NSArray *stores, NSError *error) {
                                                                              if (!error){
                                                                                  NSLog(@"no error");
                                                                              } else {
                                                                                  NSLog(@" error");
                                                                              }
                                                                          }];
                                                                          
                                                                      }
                                                                      else if (status == INTULocationStatusTimedOut) {
                                                                          // You may wish to inspect achievedAccuracy here to see if it is acceptable, if you plan to use currentLocation
                                                                          NSLog(@"Location request timed out. Current Location:\n%@", currentLocation);
                                                                          
                                                                      }
                                                                      else {
                                                                          // An error occurred
                                                                          if (status == INTULocationStatusServicesNotDetermined) {
                                                                              NSLog(@"Error: User has not responded to the permissions alert.");
                                                                          } else if (status == INTULocationStatusServicesDenied) {
                                                                              NSLog(@"Error: User has denied this app permissions to access device location.");
                                                                          } else if (status == INTULocationStatusServicesRestricted) {
                                                                              NSLog(@"Error: User is restricted from using location services by a usage policy.");
                                                                          } else if (status == INTULocationStatusServicesDisabled) {
                                                                              NSLog(@"Error: Location services are turned off for all apps on this device.");
                                                                          } else {
                                                                              NSLog(@"An unknown error occurred.\n(Are you using iOS Simulator with location set to 'None'?)");
                                                                          }
                                                                      }
                                                                      
                                                                      strongSelf.locationRequestID = NSNotFound;
                                                                  }];
}




- (void)downloadDataForRegisteredObjects:(BOOL)useUpdatedAtDate {
    
    //request the JSON
    //get the JSON
    //processJSON into coredata
    
    
}


- (void)processJSONDataRecordsIntoCoreData:(NSDictionary*)JSONDict {
    NSLog(@"dict is %@", JSONDict);
}






@end
