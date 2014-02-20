// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TimeFrame.m instead.

#import "_TimeFrame.h"

const struct TimeFrameAttributes TimeFrameAttributes = {
	.icon = @"icon",
	.summary = @"summary",
	.type = @"type",
};

const struct TimeFrameRelationships TimeFrameRelationships = {
	.datas = @"datas",
	.location = @"location",
};

const struct TimeFrameFetchedProperties TimeFrameFetchedProperties = {
};

@implementation TimeFrameID
@end

@implementation _TimeFrame

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TimeFrame" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TimeFrame";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TimeFrame" inManagedObjectContext:moc_];
}

- (TimeFrameID*)objectID {
	return (TimeFrameID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic icon;






@dynamic summary;






@dynamic type;






@dynamic datas;

	
- (NSMutableSet*)datasSet {
	[self willAccessValueForKey:@"datas"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"datas"];
  
	[self didAccessValueForKey:@"datas"];
	return result;
}
	

@dynamic location;

	






@end
