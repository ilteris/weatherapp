// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Location.m instead.

#import "_Location.h"

const struct LocationAttributes LocationAttributes = {
	.latitude = @"latitude",
	.longitude = @"longitude",
	.offset = @"offset",
	.timezone = @"timezone",
};

const struct LocationRelationships LocationRelationships = {
	.timeframes = @"timeframes",
};

const struct LocationFetchedProperties LocationFetchedProperties = {
};

@implementation LocationID
@end

@implementation _Location

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (LocationID*)objectID {
	return (LocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"offsetValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"offset"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic latitude;



- (float)latitudeValue {
	NSNumber *result = [self latitude];
	return [result floatValue];
}

- (void)setLatitudeValue:(float)value_ {
	[self setLatitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result floatValue];
}

- (void)setPrimitiveLatitudeValue:(float)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithFloat:value_]];
}





@dynamic longitude;



- (float)longitudeValue {
	NSNumber *result = [self longitude];
	return [result floatValue];
}

- (void)setLongitudeValue:(float)value_ {
	[self setLongitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result floatValue];
}

- (void)setPrimitiveLongitudeValue:(float)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithFloat:value_]];
}





@dynamic offset;



- (int16_t)offsetValue {
	NSNumber *result = [self offset];
	return [result shortValue];
}

- (void)setOffsetValue:(int16_t)value_ {
	[self setOffset:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveOffsetValue {
	NSNumber *result = [self primitiveOffset];
	return [result shortValue];
}

- (void)setPrimitiveOffsetValue:(int16_t)value_ {
	[self setPrimitiveOffset:[NSNumber numberWithShort:value_]];
}





@dynamic timezone;






@dynamic timeframes;

	
- (NSMutableSet*)timeframesSet {
	[self willAccessValueForKey:@"timeframes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"timeframes"];
  
	[self didAccessValueForKey:@"timeframes"];
	return result;
}
	






@end
