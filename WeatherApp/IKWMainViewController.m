//
//  IKWMainViewController.m
//  WeatherApp
//
//  Created by ilteris on 2/15/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWMainViewController.h"
#import "ReflectionView.h"

@interface IKWMainViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDegreesLabel;
@property (strong, nonatomic) IBOutlet ReflectionView *reflectionView;


@end

@implementation IKWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hoursCell" forIndexPath:indexPath];
    return cell;
}




- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.currentDegreesLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:110]];
    [self.locationNameLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:11]];
    [self.currentWeatherLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:17]];
   
    self.currentDegreesLabel.text = @"7°";
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
