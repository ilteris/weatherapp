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


@interface IKWMainViewController () <UICollectionViewDataSource, CLLocationManagerDelegate>
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




@end

@implementation IKWMainViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {        // Custom initialization
        
        self.locationManager = [[CLLocationManager alloc] init];
        
        // Configure Location Manager
        [self.locationManager setDelegate:self];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
        
    }
    return self;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (![locations count] || self.locationFound) return;
    
    // Stop Updating Location
    _locationFound = YES;
    [manager stopUpdatingLocation];
    
    // Current Location
    CLLocation *currentLocation = [locations objectAtIndex:0];
    
    // Reverse Geocode
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count]) {
            _locationFound = NO;
            [self processPlacemark:[placemarks objectAtIndex:0]];
        }
    }];
}

- (void)processPlacemark:(CLPlacemark *)placemark {
    // Extract Data
    NSString *city = [placemark locality];
    NSString *country = [placemark country];
    CLLocationDegrees lat = placemark.location.coordinate.latitude;
    CLLocationDegrees lon = placemark.location.coordinate.longitude;
    
    // Create Location Dictionary
    NSDictionary *currentLocation = @{  @"city" : city,
                                       @"country" : country,
                                       @"latitude" : @(lat),
                                       @"longitude" : @(lon) };
    
    // Update Current Location
    self.location = currentLocation;
    NSLog(@"currentLocation is %@",currentLocation);
   
     [[IKWForecastClient sharedClient] requestWeatherForCoordinateLatitude:[[self.location objectForKey:@"latitude"] floatValue] longitude:[[self.location objectForKey:@"longitude"] floatValue] completion:^(NSArray *stores, NSError *error) {
     if (!error){
     NSLog(@"no error");
     } else {
     NSLog(@" error");
     }
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

    if (!self.location) {
        [self.locationManager startUpdatingLocation];
    }
    
    
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
