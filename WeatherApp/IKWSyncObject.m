//
//  IKWSyncObject.m
//  WeatherApp
//
//  Created by ilteris on 3/11/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWSyncObject.h"
#import "SDCoreDataController.h"
#import "INTULocationManager.h"
#import "IKWForecastClient+Weather.h"
#import "Location.h"
#import "Data.h"


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
    
    //always need to check the latest data on the CoreData.
    //update the data strting from the latest data until whenever the api allows.
    //request the JSON
    //get the JSON
    //processJSON into coredata
    
    
}


- (void)processJSONDataRecordsIntoCoreData:(NSDictionary*)JSONDict {
    
    // for version 1.0

        NSManagedObjectContext *managedObjectContext = [[SDCoreDataController sharedInstance] masterManagedObjectContext];
    
        if (![self initialSyncComplete]) { // import all downloaded data to Core Data for initial sync
            
           
        } else { //initial already down, now need to replace / update.
            
            // let's make coredata delete everything and re-fill like a bucket if it's here.
            
            NSDictionary *JSONDictionary = [JSONDict copy];
            NSDictionary *currently = [JSONDictionary objectForKey:@"currently"];
            NSDictionary *hourly = [JSONDictionary objectForKey:@"hourly"];
            NSDictionary *daily = [JSONDictionary objectForKey:@"daily"];
            
          //  NSLog(@"currently %@",currently);

            
           // NSLog(@"latitude is %@", [JSONDictionary objectForKey:@"latitude"]);
           // NSLog(@"longitude is %@", [JSONDictionary objectForKey:@"longitude"]);
           // NSLog(@"timezone is %@", [JSONDictionary objectForKey:@"timezone"]);
           // NSLog(@"offset is %@", [JSONDictionary objectForKey:@"offset"]);
            
            NSDictionary* locationRecord = [[NSDictionary alloc] initWithObjectsAndKeys:
                                           [JSONDictionary objectForKey:@"longitude"],@"latitude",
                                           [JSONDictionary objectForKey:@"latitude"],@"longitude",
                                           [JSONDictionary objectForKey:@"timezone"],@"timezone",
                                           [JSONDictionary objectForKey:@"offset"],@"offset",
                                           nil];
            
            [self newManagedObjectWithClassName:@"Location" forRecord:locationRecord withTimeFrame:nil];
         
               
            //NSLog(@"[hourly objectForKey:@\"data\"] %@", [hourly objectForKey:@"data"]);
            
            //for currently data
            [self newManagedObjectWithClassName:@"Data" forRecord:currently withTimeFrame:@"currently"];
            
            //for minutely data (if available)
            
            /*
            for (NSDictionary *hourlyData in [hourly objectForKey:@"data"]) {
                [self newManagedObjectWithClassName:@"Data" forRecord:hourlyData];
            }
            */
            
            
            //for hourly data
            
            for (NSDictionary *hourlyData in [hourly objectForKey:@"data"]) {
                [self newManagedObjectWithClassName:@"Data" forRecord:hourlyData withTimeFrame:@"hourly"];
            }
            
            
            
            //for daily data
            
            for (NSDictionary *dailyData in [daily objectForKey:@"data"]) {
                [self newManagedObjectWithClassName:@"Data" forRecord:dailyData withTimeFrame:@"daily"];
            }
            

        }
        
        [managedObjectContext performBlockAndWait:^{
            NSError *error = nil;
            if (![managedObjectContext save:&error]) {
                NSLog(@"Unable to save context with error %@", error);
            }
            else
            {
                NSLog(@"saved");
            }
        }];
        
        [self executeSyncCompletedOperations];
   
    
    //[self downloadDataForRegisteredObjects:NO];
}


- (void)newManagedObjectWithClassName:(NSString*)className forRecord:(NSDictionary *)record withTimeFrame:(NSString*)timeFrame
{
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:[[SDCoreDataController sharedInstance] backgroundManagedObjectContext]];
    [record enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self setValue:obj forKey:key forManagedObject:newManagedObject];
    }];
    
    
    if (timeFrame) [self setValue:timeFrame forKey:@"timeFrame" forManagedObject:newManagedObject];
    
    //[record setValue:[NSNumber numberWithInt:SDObjectSynced] forKey:@"syncStatus"];
}

- (void)updateManagedObject:(NSManagedObject *)managedObject withRecord:(NSDictionary *)record {
    [record enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [self setValue:obj forKey:key forManagedObject:managedObject];
    }];
}

- (void)setValue:(id)value forKey:(NSString *)key forManagedObject:(NSManagedObject *)managedObject {
    if ([key isEqualToString:@"createdAt"] || [key isEqualToString:@"updatedAt"]) {
       // NSDate *date = [self dateUsingStringFromAPI:value];
       // [managedObject setValue:date forKey:key];
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        if ([value objectForKey:@"__type"]) {
            NSString *dataType = [value objectForKey:@"__type"];
            if ([dataType isEqualToString:@"Date"]) {
                NSString *dateString = [value objectForKey:@"iso"];
             //   NSDate *date = [self dateUsingStringFromAPI:dateString];
             //   [managedObject setValue:date forKey:key];
            } else if ([dataType isEqualToString:@"File"]) {
                NSString *urlString = [value objectForKey:@"url"];
                NSURL *url = [NSURL URLWithString:urlString];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                NSURLResponse *response = nil;
                NSError *error = nil;
                NSData *dataResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                [managedObject setValue:dataResponse forKey:key];
            } else {
                NSLog(@"Unknown Data Type Received");
                [managedObject setValue:nil forKey:key];
            }
        }
    } else { //if it cannot find the key it shouldn't crash, so add NSParameterAssert to avoid a crash.
        //also need to add the time frame somewhere here.
        [managedObject setValue:value forKey:key];
    }
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
