// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Data.h instead.

#import <CoreData/CoreData.h>


extern const struct DataAttributes {
	__unsafe_unretained NSString *apparentTemperature;
	__unsafe_unretained NSString *cloudCover;
	__unsafe_unretained NSString *dewPoint;
	__unsafe_unretained NSString *humidity;
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *ozone;
	__unsafe_unretained NSString *precipIntensity;
	__unsafe_unretained NSString *precipProbability;
	__unsafe_unretained NSString *pressure;
	__unsafe_unretained NSString *summary;
	__unsafe_unretained NSString *temperature;
	__unsafe_unretained NSString *time;
	__unsafe_unretained NSString *windBearing;
	__unsafe_unretained NSString *windSpeed;
} DataAttributes;

extern const struct DataRelationships {
	__unsafe_unretained NSString *timeframe;
} DataRelationships;

extern const struct DataFetchedProperties {
} DataFetchedProperties;

@class TimeFrame;
















@interface DataID : NSManagedObjectID {}
@end

@interface _Data : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DataID*)objectID;





@property (nonatomic, strong) NSNumber* apparentTemperature;



@property float apparentTemperatureValue;
- (float)apparentTemperatureValue;
- (void)setApparentTemperatureValue:(float)value_;

//- (BOOL)validateApparentTemperature:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* cloudCover;



@property float cloudCoverValue;
- (float)cloudCoverValue;
- (void)setCloudCoverValue:(float)value_;

//- (BOOL)validateCloudCover:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* dewPoint;



@property float dewPointValue;
- (float)dewPointValue;
- (void)setDewPointValue:(float)value_;

//- (BOOL)validateDewPoint:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* humidity;



@property float humidityValue;
- (float)humidityValue;
- (void)setHumidityValue:(float)value_;

//- (BOOL)validateHumidity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* icon;



//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ozone;



@property float ozoneValue;
- (float)ozoneValue;
- (void)setOzoneValue:(float)value_;

//- (BOOL)validateOzone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* precipIntensity;



@property float precipIntensityValue;
- (float)precipIntensityValue;
- (void)setPrecipIntensityValue:(float)value_;

//- (BOOL)validatePrecipIntensity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* precipProbability;



@property float precipProbabilityValue;
- (float)precipProbabilityValue;
- (void)setPrecipProbabilityValue:(float)value_;

//- (BOOL)validatePrecipProbability:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* pressure;



@property float pressureValue;
- (float)pressureValue;
- (void)setPressureValue:(float)value_;

//- (BOOL)validatePressure:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* temperature;



@property float temperatureValue;
- (float)temperatureValue;
- (void)setTemperatureValue:(float)value_;

//- (BOOL)validateTemperature:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* time;



//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* windBearing;



@property float windBearingValue;
- (float)windBearingValue;
- (void)setWindBearingValue:(float)value_;

//- (BOOL)validateWindBearing:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* windSpeed;



@property float windSpeedValue;
- (float)windSpeedValue;
- (void)setWindSpeedValue:(float)value_;

//- (BOOL)validateWindSpeed:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) TimeFrame *timeframe;

//- (BOOL)validateTimeframe:(id*)value_ error:(NSError**)error_;





@end

@interface _Data (CoreDataGeneratedAccessors)

@end

@interface _Data (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveApparentTemperature;
- (void)setPrimitiveApparentTemperature:(NSNumber*)value;

- (float)primitiveApparentTemperatureValue;
- (void)setPrimitiveApparentTemperatureValue:(float)value_;




- (NSNumber*)primitiveCloudCover;
- (void)setPrimitiveCloudCover:(NSNumber*)value;

- (float)primitiveCloudCoverValue;
- (void)setPrimitiveCloudCoverValue:(float)value_;




- (NSNumber*)primitiveDewPoint;
- (void)setPrimitiveDewPoint:(NSNumber*)value;

- (float)primitiveDewPointValue;
- (void)setPrimitiveDewPointValue:(float)value_;




- (NSNumber*)primitiveHumidity;
- (void)setPrimitiveHumidity:(NSNumber*)value;

- (float)primitiveHumidityValue;
- (void)setPrimitiveHumidityValue:(float)value_;




- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;




- (NSNumber*)primitiveOzone;
- (void)setPrimitiveOzone:(NSNumber*)value;

- (float)primitiveOzoneValue;
- (void)setPrimitiveOzoneValue:(float)value_;




- (NSNumber*)primitivePrecipIntensity;
- (void)setPrimitivePrecipIntensity:(NSNumber*)value;

- (float)primitivePrecipIntensityValue;
- (void)setPrimitivePrecipIntensityValue:(float)value_;




- (NSNumber*)primitivePrecipProbability;
- (void)setPrimitivePrecipProbability:(NSNumber*)value;

- (float)primitivePrecipProbabilityValue;
- (void)setPrimitivePrecipProbabilityValue:(float)value_;




- (NSNumber*)primitivePressure;
- (void)setPrimitivePressure:(NSNumber*)value;

- (float)primitivePressureValue;
- (void)setPrimitivePressureValue:(float)value_;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;




- (NSNumber*)primitiveTemperature;
- (void)setPrimitiveTemperature:(NSNumber*)value;

- (float)primitiveTemperatureValue;
- (void)setPrimitiveTemperatureValue:(float)value_;




- (NSDate*)primitiveTime;
- (void)setPrimitiveTime:(NSDate*)value;




- (NSNumber*)primitiveWindBearing;
- (void)setPrimitiveWindBearing:(NSNumber*)value;

- (float)primitiveWindBearingValue;
- (void)setPrimitiveWindBearingValue:(float)value_;




- (NSNumber*)primitiveWindSpeed;
- (void)setPrimitiveWindSpeed:(NSNumber*)value;

- (float)primitiveWindSpeedValue;
- (void)setPrimitiveWindSpeedValue:(float)value_;





- (TimeFrame*)primitiveTimeframe;
- (void)setPrimitiveTimeframe:(TimeFrame*)value;


@end
