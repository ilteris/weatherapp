//
//  Location.h
//  WeatherApp
//
//  Created by ilteris on 3/23/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Data;

@interface Location : NSManagedObject

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) int16_t offset;
@property (nonatomic, retain) NSString * timezone;
@property (nonatomic, retain) NSSet *datas;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addDatasObject:(Data *)value;
- (void)removeDatasObject:(Data *)value;
- (void)addDatas:(NSSet *)values;
- (void)removeDatas:(NSSet *)values;

@end
