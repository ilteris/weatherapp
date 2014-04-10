//
//  IKWDayCollectionViewCell.h
//  WeatherApp
//
//  Created by ilteris on 4/10/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKWDayCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxDegreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *minDegreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekDayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@end
