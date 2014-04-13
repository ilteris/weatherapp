//
//  IKWCurrentHeader.h
//  WeatherApp
//
//  Created by ilteris on 4/12/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReflectionView;

@interface IKWCurrentHeader : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *currentlyIconView;
@property (weak, nonatomic) IBOutlet ReflectionView *iconReflectionView;
@property (weak, nonatomic) IBOutlet UILabel *currentDegreesLabel;
@property (strong, nonatomic) IBOutlet ReflectionView *temperatureReflectionView;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;


-(void)updateCurrentWeatherWithData:(NSArray*)currently;

@end
