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
    //NSLog(@"dict is %@", JSONDict);
    NSManagedObjectContext *managedObjectContext = [[SDCoreDataController sharedInstance] backgroundManagedObjectContext];
        if (![self initialSyncComplete]) { // import all downloaded data to Core Data for initial sync
            NSDictionary *JSONDictionary = [JSONDict copy];
            
           
        } else { //initial already down, now need to replace / update.
            
            NSDictionary *JSONDictionary = [JSONDict copy];
            NSArray *currently = [JSONDictionary objectForKey:@"currently"];
            NSArray *hourly = [JSONDictionary objectForKey:@"hourly"];
            NSArray *daily = [JSONDictionary objectForKey:@"daily"];
            
            NSLog(@"latitude is %@", [JSONDictionary objectForKey:@"latitude"]);
            NSLog(@"latitude is %@", [JSONDictionary objectForKey:@"longitude"]);
            NSLog(@"timezone is %@", [JSONDictionary objectForKey:@"timezone"]);
            NSLog(@"offset is %@", [JSONDictionary objectForKey:@"offset"]);
            
            NSLog(@"currently %@",currently);
            /*
            for (NSDictionary *record in records) {
                NSLog(@"record is %@", record);
            }
             */
            
            /*
            NSArray *downloadedRecords = [self JSONDataRecordsForClass:className sortedByKey:@"objectId"];
            if ([downloadedRecords lastObject]) {
                NSArray *storedRecords = [self managedObjectsForClass:className sortedByKey:@"objectId" usingArrayOfIds:[downloadedRecords valueForKey:@"objectId"] inArrayOfIds:YES];
                int currentIndex = 0;
                for (NSDictionary *record in downloadedRecords) {
                    NSManagedObject *storedManagedObject = nil;
                    if ([storedRecords count] > currentIndex) {
                        storedManagedObject = [storedRecords objectAtIndex:currentIndex];
                    }
                    
                    if ([[storedManagedObject valueForKey:@"objectId"] isEqualToString:[record valueForKey:@"objectId"]]) {
                        [self updateManagedObject:[storedRecords objectAtIndex:currentIndex] withRecord:record];
                    } else {
                        [self newManagedObjectWithClassName:className forRecord:record];
                    }
                    currentIndex++;
                }
            }
             */
        }
        
        [managedObjectContext performBlockAndWait:^{
            NSError *error = nil;
            if (![managedObjectContext save:&error]) {
                NSLog(@"Unable to save context with error %@", error);
            }
        }];
        
        [self executeSyncCompletedOperations];
   
    
    //[self downloadDataForRegisteredObjects:NO];
}

- (void)executeSyncCompletedOperations {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setInitialSyncCompleted];
        NSError *error = nil;
        [[SDCoreDataController sharedInstance] saveBackgroundContext];
        if (error) {
            NSLog(@"Error saving background context after creating objects on server: %@", error);
        }
        
        [[SDCoreDataController sharedInstance] saveMasterContext];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:kIKWSyncObjectSyncCompletedNotificationName
         object:nil];
        [self willChangeValueForKey:@"syncInProgress"];
        _syncInProgress = NO;
        [self didChangeValueForKey:@"syncInProgress"];
    });
}

- (BOOL)initialSyncComplete {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kIKWSyncObjectInitialCompleteKey] boolValue];
}

- (void)setInitialSyncCompleted {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:kIKWSyncObjectInitialCompleteKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
