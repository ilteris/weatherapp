// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Data.m instead.

#import "_Data.h"

const struct DataAttributes DataAttributes = {
	.apparentTemperature = @"apparentTemperature",
	.cloudCover = @"cloudCover",
	.dewPoint = @"dewPoint",
	.humidity = @"humidity",
	.icon = @"icon",
	.ozone = @"ozone",
	.precipIntensity = @"precipIntensity",
	.precipProbability = @"precipProbability",
	.pressure = @"pressure",
	.summary = @"summary",
	.temperature = @"temperature",
	.time = @"time",
	.windBearing = @"windBearing",
	.windSpeed = @"windSpeed",
};

const struct DataRelationships DataRelationships = {
	.timeframe = @"timeframe",
};

const struct DataFetchedProperties DataFetchedProperties = {
};

@implementation DataID
@end

@implementation _Data

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Data";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Data" inManagedObjectContext:moc_];
}

- (DataID*)objectID {
	return (DataID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apparentTemperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apparentTemperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"cloudCoverValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cloudCover"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dewPointValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dewPoint"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"humidityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"humidity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"ozoneValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ozone"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"precipIntensityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"precipIntensity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"precipProbabilityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"precipProbability"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pressureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pressure"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"temperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windBearingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windBearing"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"windSpeedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"windSpeed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic apparentTemperature;



- (float)apparentTemperatureValue {
	NSNumber *result = [self apparentTemperature];
	return [result floatValue];
}

- (void)setApparentTemperatureValue:(float)value_ {
	[self setApparentTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveApparentTemperatureValue {
	NSNumber *result = [self primitiveApparentTemperature];
	return [result floatValue];
}

- (void)setPrimitiveApparentTemperatureValue:(float)value_ {
	[self setPrimitiveApparentTemperature:[NSNumber numberWithFloat:value_]];
}





@dynamic cloudCover;



- (float)cloudCoverValue {
	NSNumber *result = [self cloudCover];
	return [result floatValue];
}

- (void)setCloudCoverValue:(float)value_ {
	[self setCloudCover:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveCloudCoverValue {
	NSNumber *result = [self primitiveCloudCover];
	return [result floatValue];
}

- (void)setPrimitiveCloudCoverValue:(float)value_ {
	[self setPrimitiveCloudCover:[NSNumber numberWithFloat:value_]];
}





@dynamic dewPoint;



- (float)dewPointValue {
	NSNumber *result = [self dewPoint];
	return [result floatValue];
}

- (void)setDewPointValue:(float)value_ {
	[self setDewPoint:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveDewPointValue {
	NSNumber *result = [self primitiveDewPoint];
	return [result floatValue];
}

- (void)setPrimitiveDewPointValue:(float)value_ {
	[self setPrimitiveDewPoint:[NSNumber numberWithFloat:value_]];
}





@dynamic humidity;



- (float)humidityValue {
	NSNumber *result = [self humidity];
	return [result floatValue];
}

- (void)setHumidityValue:(float)value_ {
	[self setHumidity:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveHumidityValue {
	NSNumber *result = [self primitiveHumidity];
	return [result floatValue];
}

- (void)setPrimitiveHumidityValue:(float)value_ {
	[self setPrimitiveHumidity:[NSNumber numberWithFloat:value_]];
}





@dynamic icon;






@dynamic ozone;



- (float)ozoneValue {
	NSNumber *result = [self ozone];
	return [result floatValue];
}

- (void)setOzoneValue:(float)value_ {
	[self setOzone:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveOzoneValue {
	NSNumber *result = [self primitiveOzone];
	return [result floatValue];
}

- (void)setPrimitiveOzoneValue:(float)value_ {
	[self setPrimitiveOzone:[NSNumber numberWithFloat:value_]];
}





@dynamic precipIntensity;



- (float)precipIntensityValue {
	NSNumber *result = [self precipIntensity];
	return [result floatValue];
}

- (void)setPrecipIntensityValue:(float)value_ {
	[self setPrecipIntensity:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePrecipIntensityValue {
	NSNumber *result = [self primitivePrecipIntensity];
	return [result floatValue];
}

- (void)setPrimitivePrecipIntensityValue:(float)value_ {
	[self setPrimitivePrecipIntensity:[NSNumber numberWithFloat:value_]];
}





@dynamic precipProbability;



- (float)precipProbabilityValue {
	NSNumber *result = [self precipProbability];
	return [result floatValue];
}

- (void)setPrecipProbabilityValue:(float)value_ {
	[self setPrecipProbability:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePrecipProbabilityValue {
	NSNumber *result = [self primitivePrecipProbability];
	return [result floatValue];
}

- (void)setPrimitivePrecipProbabilityValue:(float)value_ {
	[self setPrimitivePrecipProbability:[NSNumber numberWithFloat:value_]];
}





@dynamic pressure;



- (float)pressureValue {
	NSNumber *result = [self pressure];
	return [result floatValue];
}

- (void)setPressureValue:(float)value_ {
	[self setPressure:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePressureValue {
	NSNumber *result = [self primitivePressure];
	return [result floatValue];
}

- (void)setPrimitivePressureValue:(float)value_ {
	[self setPrimitivePressure:[NSNumber numberWithFloat:value_]];
}





@dynamic summary;






@dynamic temperature;



- (float)temperatureValue {
	NSNumber *result = [self temperature];
	return [result floatValue];
}

- (void)setTemperatureValue:(float)value_ {
	[self setTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTemperatureValue {
	NSNumber *result = [self primitiveTemperature];
	return [result floatValue];
}

- (void)setPrimitiveTemperatureValue:(float)value_ {
	[self setPrimitiveTemperature:[NSNumber numberWithFloat:value_]];
}





@dynamic time;






@dynamic windBearing;



- (float)windBearingValue {
	NSNumber *result = [self windBearing];
	return [result floatValue];
}

- (void)setWindBearingValue:(float)value_ {
	[self setWindBearing:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveWindBearingValue {
	NSNumber *result = [self primitiveWindBearing];
	return [result floatValue];
}

- (void)setPrimitiveWindBearingValue:(float)value_ {
	[self setPrimitiveWindBearing:[NSNumber numberWithFloat:value_]];
}





@dynamic windSpeed;



- (float)windSpeedValue {
	NSNumber *result = [self windSpeed];
	return [result floatValue];
}

- (void)setWindSpeedValue:(float)value_ {
	[self setWindSpeed:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveWindSpeedValue {
	NSNumber *result = [self primitiveWindSpeed];
	return [result floatValue];
}

- (void)setPrimitiveWindSpeedValue:(float)value_ {
	[self setPrimitiveWindSpeed:[NSNumber numberWithFloat:value_]];
}





@dynamic timeframe;

	






@end
