//
//  IKWDailyViewController.m
//  WeatherApp
//
//  Created by ilteris on 4/10/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWDailyViewController.h"
#import "IKWDayCollectionViewCell.h"
#import "IKWDayCollectionViewCell+ConfigureForCell.h"
#import "Data.h"


@interface IKWDailyViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IKWDailyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)reloadData {
    
    [self.collectionView reloadData];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IKWDayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayCell" forIndexPath:indexPath];
    
    Data *data = [self.data objectAtIndex:indexPath.row];
    
    
    [cell configureForCell:data];
    
    return cell;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewdidload for daily view");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
