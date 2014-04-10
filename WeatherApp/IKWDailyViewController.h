//
//  IKWDailyViewController.h
//  WeatherApp
//
//  Created by ilteris on 4/10/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKWDailyViewController : UIViewController

@property (nonatomic, copy) NSArray *data;

-(void)reloadData;
@end
