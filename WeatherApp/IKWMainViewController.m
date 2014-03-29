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
#import "SDCoreDataController.h"
#import "IKWSyncObject.h"
#import "Data.h"
#import "Location.h"


@interface IKWMainViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDegreesLabel;
@property (strong, nonatomic) IBOutlet ReflectionView *reflectionView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@property (nonatomic, strong) NSArray *hourlyItems;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UICollectionView *hourCollectionView;






@end

@implementation IKWMainViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {        // Custom initialization
        
        
    }
    return self;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.hourlyItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"reload collectionview cellForItemAtIndexPath");
    IKWHourCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hoursCell" forIndexPath:indexPath];
    
    Data *data = [self.hourlyItems objectAtIndex:indexPath.row];
    
    [cell.hourLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:14]];
    [cell.weatherLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:8]];
    [cell.rainProbLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:11]];
    
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h a"];
    
    NSString *startTimeString = [formatter stringFromDate: [NSDate dateWithTimeIntervalSince1970:data.time]];
    
    
    cell.hourLabel.text = startTimeString;
    cell.weatherLabel.text = [NSLocalizedString(data.summary, nil ) uppercaseString]; //@"PARÇALI BULUTLU";
    cell.weatherIcon.image = [UIImage imageNamed:@"weatherapp-parcalibulutluicon"];
    
    return cell;
}



- (void)loadRecordsFromCoreData {
    NSLog(@"loadRecordsFromCoreData");
    
    
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Data"];
        [request setSortDescriptors:[NSArray arrayWithObject:
                                     [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES]]];
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"timeFrame = %@", @"hourly"];
        [request setPredicate:predicate];
        self.hourlyItems =  [self.managedObjectContext executeFetchRequest:request error:&error];
        //NSLog(@"items are %@", items);
        for (Data* data in self.hourlyItems) {
            NSLog(@"Data.summary is %@", data.summary);
        }
        
        if (nil == self.hourlyItems)
            NSLog(@"Failed to fetch  items: %@", error);
        
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];

    [self loadRecordsFromCoreData];

    
    self.scrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, self.view.frame.size.height);
    
    
    [self.currentDegreesLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:110]];
    [self.locationNameLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:11]];
    [self.currentWeatherLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:17]];
    
    self.currentDegreesLabel.text = @"12°";
        
}

- (void)checkSyncStatus {
    if ([[IKWSyncObject sharedEngine] syncInProgress]) {
        NSLog(@"sync is in progress");
        } else {
        NSLog(@"sync is not in progress");
    }
}



- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"viewDidAppear");
    
    [super viewDidAppear:animated];
    
    [self checkSyncStatus];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"IKWSyncObjectSyncCompleted" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self loadRecordsFromCoreData];
        [self.hourCollectionView reloadData]; //might as well reload in batch.
        
        
    }];
    [[IKWSyncObject sharedEngine] addObserver:self forKeyPath:@"syncInProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"IKWSyncObjectSyncCompleted" object:nil];
    [[IKWSyncObject sharedEngine] removeObserver:self forKeyPath:@"syncInProgress"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"syncInProgress"]) {
        [self checkSyncStatus];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
