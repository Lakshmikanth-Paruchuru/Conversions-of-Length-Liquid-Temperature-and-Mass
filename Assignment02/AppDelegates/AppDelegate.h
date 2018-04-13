//
//  AppDelegate.h
//  Assignment02
//
//  Created by Mohammad, Abdul Rahman on 10/16/17.
//  Copyright © 2017 Mohammad, Abdul Rahman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

