//
//  CoreDataManager.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NSManagedObjectContext;

@interface CoreDataManager : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedManager;

- (NSArray *)getAllPersons;

- (NSArray *)getAllCards;

@end
