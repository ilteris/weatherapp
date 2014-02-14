//
//  IKWAppDelegate.h
//  WeatherApp
//
//  Created by ilteris on 2/13/14.
//  Copyright (c) 2014 ilteris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
