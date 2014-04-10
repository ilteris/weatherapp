//
//  IKWMainViewController.m
//  WeatherApp
//
//  Created by ilteris on 2/15/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWMainViewController.h"
#import "IKWHourCollectionViewCell.h"
#import "SDCoreDataController.h"
#import "IKWSyncObject.h"
#import "Data.h"
#import "Location.h"
#import "IKWCurrentlyViewController.h"
#import "IKWHourCollectionViewCell+ConfigureForCell.h"

@interface IKWMainViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@property (nonatomic, strong) NSArray *hourlyItems;
@property (nonatomic, strong) NSArray *totalData;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UICollectionView *hourCollectionView;

@property (strong, nonatomic) IKWCurrentlyViewController *currentlyViewController;



@end

@implementation IKWMainViewController


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.hourlyItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IKWHourCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hoursCell" forIndexPath:indexPath];
    
    Data *data = [self.hourlyItems objectAtIndex:indexPath.row];
    
    [cell configureForCell:data];

    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"currentlyViewController"]) {
        self.currentlyViewController = segue.destinationViewController;
        
    }
    
}


- (void)loadRecordsFromCoreData {
    NSLog(@"loadRecordsFromCoreData");
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Data"];
        [request setSortDescriptors:[NSArray arrayWithObject:
                                     [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES]]];
        
        self.totalData =  [self.managedObjectContext executeFetchRequest:request error:&error];
        
        if (nil == self.totalData)
            NSLog(@"Failed to fetch  items: %@", error);
        
        
        
        NSPredicate *hourlyPredicate = [NSPredicate predicateWithFormat:@"timeFrame =  %@", @"hourly"];
        
        self.hourlyItems = [self.totalData filteredArrayUsingPredicate:hourlyPredicate];
        
        NSPredicate *currentlyPredicate = [NSPredicate predicateWithFormat:@"timeFrame =  %@", @"currently"];
        
        NSArray *currentlyData = [self.totalData filteredArrayUsingPredicate:currentlyPredicate];
        
        [self.currentlyViewController updateCurrentWeatherWithData:currentlyData];
        
        
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadRecordsFromCoreData];
    self.scrollView.contentSize = CGSizeMake(2 * self.view.frame.size.width, self.view.frame.size.height);
    
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
        NSLog(@"IKWSyncObjectSyncCompleted is IKWSyncObjectSyncCompleted");
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
