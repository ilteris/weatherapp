// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TimeFrame.h instead.

#import <CoreData/CoreData.h>


extern const struct TimeFrameAttributes {
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *summary;
	__unsafe_unretained NSString *type;
} TimeFrameAttributes;

extern const struct TimeFrameRelationships {
	__unsafe_unretained NSString *datas;
	__unsafe_unretained NSString *location;
} TimeFrameRelationships;

extern const struct TimeFrameFetchedProperties {
} TimeFrameFetchedProperties;

@class Data;
@class Location;





@interface TimeFrameID : NSManagedObjectID {}
@end

@interface _TimeFrame : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TimeFrameID*)objectID;





@property (nonatomic, strong) NSString* icon;



//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *datas;

- (NSMutableSet*)datasSet;




@property (nonatomic, strong) Location *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;





@end

@interface _TimeFrame (CoreDataGeneratedAccessors)

- (void)addDatas:(NSSet*)value_;
- (void)removeDatas:(NSSet*)value_;
- (void)addDatasObject:(Data*)value_;
- (void)removeDatasObject:(Data*)value_;

@end

@interface _TimeFrame (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (NSMutableSet*)primitiveDatas;
- (void)setPrimitiveDatas:(NSMutableSet*)value;



- (Location*)primitiveLocation;
- (void)setPrimitiveLocation:(Location*)value;


@end
