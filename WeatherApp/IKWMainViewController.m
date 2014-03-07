//
//  IKWMainViewController.m
//  WeatherApp
//
//  Created by ilteris on 2/15/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWMainViewController.h"
#import "ReflectionView.h"
#import "IKWHourCollectionViewCell.h"

#import "IKWForecastClient+Weather.h"

#import "Data.h"
#import "Location.h"
#import "TimeFrame.h"

#import "INTULocationManager.h"

@interface IKWMainViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDegreesLabel;
@property (strong, nonatomic) IBOutlet ReflectionView *reflectionView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

//location
@property (strong, nonatomic) NSDictionary *location;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (assign, nonatomic) BOOL locationFound;


@property (assign, nonatomic) NSInteger locationRequestID;
@property (assign, nonatomic) INTULocationAccuracy desiredAccuracy;
@property (assign, nonatomic) NSTimeInterval timeout;




@end

@implementation IKWMainViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {        // Custom initialization
        
        
    }
    return self;
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




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IKWHourCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hoursCell" forIndexPath:indexPath];
    
    [cell.hourLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:14]];
    [cell.weatherLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:8]];
    [cell.rainProbLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:11]];
    
    
    cell.hourLabel.text = @"9AM";
    cell.weatherLabel.text = @"PARÇALI BULUTLU";
    cell.weatherIcon.image = [UIImage imageNamed:@"weatherapp-parcalibulutluicon"];
    
    return cell;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.desiredAccuracy = INTULocationAccuracyCity;
    self.timeout = 10.0;
    
    self.locationRequestID = NSNotFound;
    
    [self startLocationRequest];
    
    self.scrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, self.view.frame.size.height);
    
    
    [self.currentDegreesLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:110]];
    [self.locationNameLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:11]];
    [self.currentWeatherLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:17]];
    
    self.currentDegreesLabel.text = @"12°";
    
    NSLog(@"is %f", [[self.location objectForKey:@"latitude"] doubleValue]);
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
