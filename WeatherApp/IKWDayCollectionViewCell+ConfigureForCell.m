//
//  IKWDayCollectionViewCell+ConfigureForCell.m
//  WeatherApp
//
//  Created by ilteris on 4/10/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWDayCollectionViewCell+ConfigureForCell.h"
#import "Data.h"

@implementation IKWDayCollectionViewCell (ConfigureForCell)
- (void) configureForCell:(Data*)data
{
    [self.weatherLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:10]];
    [self.maxDegreeLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:15]];
    [self.minDegreeLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:15]];
    [self.weekDayLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:10]];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h a"];
    
    NSString *startTimeString = [formatter stringFromDate: [NSDate dateWithTimeIntervalSince1970:data.time]];
    
    self.weatherLabel.text = [NSLocalizedString(data.summary, nil) uppercaseString];
    /*
    self.hourLabel.text = startTimeString;
    
    */
    
    int roundedMin = (data.temperatureMin + 0.5);
    self.minDegreeLabel.text = [NSString stringWithFormat:@"%i°", roundedMin];

    int roundedMax = (data.temperatureMax + 0.5);
    self.maxDegreeLabel.text = [NSString stringWithFormat:@"%i°", roundedMax];

    
    self.weatherIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", data.icon]];

}
@end
