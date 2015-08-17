//
//  CoreDataManager.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject

+ (instancetype)sharedManager;

- (NSArray *)getAllPersons;

- (NSArray *)getAllCards;

@end
