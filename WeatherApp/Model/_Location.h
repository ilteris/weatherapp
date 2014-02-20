// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Location.h instead.

#import <CoreData/CoreData.h>


extern const struct LocationAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *offset;
	__unsafe_unretained NSString *timezone;
} LocationAttributes;

extern const struct LocationRelationships {
	__unsafe_unretained NSString *timeframes;
} LocationRelationships;

extern const struct LocationFetchedProperties {
} LocationFetchedProperties;

@class TimeFrame;






@interface LocationID : NSManagedObjectID {}
@end

@interface _Location : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LocationID*)objectID;





@property (nonatomic, strong) NSNumber* latitude;



@property float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* offset;



@property int16_t offsetValue;
- (int16_t)offsetValue;
- (void)setOffsetValue:(int16_t)value_;

//- (BOOL)validateOffset:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* timezone;



//- (BOOL)validateTimezone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *timeframes;

- (NSMutableSet*)timeframesSet;





@end

@interface _Location (CoreDataGeneratedAccessors)

- (void)addTimeframes:(NSSet*)value_;
- (void)removeTimeframes:(NSSet*)value_;
- (void)addTimeframesObject:(TimeFrame*)value_;
- (void)removeTimeframesObject:(TimeFrame*)value_;

@end

@interface _Location (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;




- (NSNumber*)primitiveOffset;
- (void)setPrimitiveOffset:(NSNumber*)value;

- (int16_t)primitiveOffsetValue;
- (void)setPrimitiveOffsetValue:(int16_t)value_;




- (NSString*)primitiveTimezone;
- (void)setPrimitiveTimezone:(NSString*)value;





- (NSMutableSet*)primitiveTimeframes;
- (void)setPrimitiveTimeframes:(NSMutableSet*)value;


@end
