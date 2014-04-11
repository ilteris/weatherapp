//
//  IKWHourCollectionViewCell+ConfigureForCell.m
//  WeatherApp
//
//  Created by ilteris on 4/9/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWHourCollectionViewCell+ConfigureForCell.h"
#import "Data.h"

@implementation IKWHourCollectionViewCell (ConfigureForCell)
- (void) configureForCell:(Data*)data
{
    [self.hourLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:14]];
    [self.weatherLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:8]];
    [self.rainProbLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:11]];
    [self.temperatureLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:13]];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h a"];
    
    NSString *startTimeString = [formatter stringFromDate: [NSDate dateWithTimeIntervalSince1970:data.time]];
    
    
    self.hourLabel.text = startTimeString;
    self.weatherLabel.text = [NSLocalizedString(data.summary, nil) uppercaseString];
    int rounded = (data.temperature + 0.5);
    self.temperatureLabel.text = [NSString stringWithFormat:@"%i°", rounded];
    
    self.weatherIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", data.icon]];
    NSLog(@"cell.containerRainProbView is %@", NSStringFromCGRect(self.heightRainGraph.frame));

    CGFloat height = self.heightRainGraph.frame.size.height;
    NSLog(@"height is %f", height); //41 is 100 per cent rain probability.
    CGFloat newHeight = data.precipProbability * height * 100;
    CGRect cellRect = self.heightRainGraph.frame;
    cellRect.size.height = -100*data.precipProbability;
    cellRect.origin.y = 340;
    self.heightRainGraph.frame = cellRect;
    NSLog(@"cell.containerRainProbView is %@", NSStringFromCGRect(self.heightRainGraph.frame));
    NSLog(@"precipProbability is %f", data.precipProbability);
    NSLog(@"new height is %f", newHeight); //41 is 100 per cent rain probability.
    
}
@end
