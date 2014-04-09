//
//  IKWCurrentlyViewController.m
//  WeatherApp
//
//  Created by ilteris on 4/9/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWCurrentlyViewController.h"
#import "ReflectionView.h"

@interface IKWCurrentlyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *currentlyIconView;
@property (weak, nonatomic) IBOutlet ReflectionView *iconReflectionView;
@property (weak, nonatomic) IBOutlet UILabel *currentDegreesLabel;
@property (strong, nonatomic) IBOutlet ReflectionView *temperatureReflectionView;

@end

@implementation IKWCurrentlyViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.currentDegreesLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:110]];
    /*
    self.currentlyIconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"c_%@",data.icon]];
    self.currentlyIconView.frame = CGRectMake(self.currentlyIconView.frame.origin.x, self.currentlyIconView.frame.origin.y,[self getImageSizeForIcon:data.icon].width,[self getImageSizeForIcon:data.icon].height);
    self.iconReflectionView.frame =CGRectMake(self.iconReflectionView.frame.origin.x, self.iconReflectionView.frame.origin.y,[self getImageSizeForIcon:data.icon].width,[self getImageSizeForIcon:data.icon].height);

     int rounded = (data.temperature + 0.5);

    self.currentDegreesLabel.text = [NSString stringWithFormat:@"%i°", rounded];
    [self.temperatureReflectionView updateReflection];
    [self.iconReflectionView updateReflection];
    */
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
