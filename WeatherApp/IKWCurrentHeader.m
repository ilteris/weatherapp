//
//  IKWCurrentHeader.m
//  WeatherApp
//
//  Created by ilteris on 4/12/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import "IKWCurrentHeader.h"
#import "ReflectionView.h"
#import "SDCoreDataController.h"
#import "Data.h"

@interface IKWCurrentHeader ()



@end
@implementation IKWCurrentHeader



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(void)updateCurrentWeatherWithData:(NSArray*)currently;
{
    
    //[self.locationNameLabel setFont:[UIFont fontWithName:@"Gotham-Medium" size:11]];
    [self.currentWeatherLabel setFont:[UIFont fontWithName:@"Gotham-Book" size:23]];
    
    
    for (Data* data in currently) {
        NSLog(@"Data.summary is %f", data.temperature);
        //set the icon view based on the icon here
        [self getImageSizeForIcon:data.icon];
        
        [self.currentDegreesLabel setFont:[UIFont fontWithName:@"Gotham-Thin" size:120]];
        [self.currentDegreesLabel setAutoresizingMask:UIViewAutoresizingFlexibleHeight];

        self.currentlyIconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"c_%@",data.icon]];
        self.currentlyIconView.frame = CGRectMake(self.currentlyIconView.frame.origin.x, self.currentlyIconView.frame.origin.y,[self getImageSizeForIcon:data.icon].width,[self getImageSizeForIcon:data.icon].height);
        self.iconReflectionView.frame =CGRectMake(self.iconReflectionView.frame.origin.x, self.iconReflectionView.frame.origin.y,[self getImageSizeForIcon:data.icon].width,[self getImageSizeForIcon:data.icon].height);
        
        int rounded = (data.temperature + 0.5);
        
        self.currentDegreesLabel.text = [NSString stringWithFormat:@"%i°", rounded];
        [self.currentDegreesLabel setAutoresizingMask:UIViewAutoresizingFlexibleHeight];

        [self.temperatureReflectionView updateReflection];
        [self.iconReflectionView updateReflection];
        
        self.currentWeatherLabel.text = [NSLocalizedString(data.summary, nil) uppercaseString];
    }
    
    
}


-(CGSize)getImageSizeForIcon:(NSString*)iconName {
    
    
    NSDictionary *iconsSizes = @{
                                 @"clear-day" : [NSValue valueWithCGSize:(CGSize){85, 85}],
                                 @"clear-night" : [NSValue valueWithCGSize:(CGSize){85, 85}],
                                 @"cloudy" : [NSValue valueWithCGSize:(CGSize){105, 65}],
                                 @"fog" : [NSValue valueWithCGSize:(CGSize){103, 101}],
                                 @"partly-cloudy-day" : [NSValue valueWithCGSize:(CGSize){105, 85}],
                                 @"partly-cloudy-night" : [NSValue valueWithCGSize:(CGSize){105, 85}],
                                 @"sleet" : [NSValue valueWithCGSize:(CGSize){105, 95}],
                                 @"snow" : [NSValue valueWithCGSize:(CGSize){105, 97}],
                                 @"rain" : [NSValue valueWithCGSize:(CGSize){103, 94}],
                                 @"wind" : [NSValue valueWithCGSize:(CGSize){105, 94}]
                                 };
    
    
    CGSize size = [iconsSizes[iconName] CGSizeValue];
    NSLog(@"iconName is %@, %@", iconName, NSStringFromCGSize(size));
    return size;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
