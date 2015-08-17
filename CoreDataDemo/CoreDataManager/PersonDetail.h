//
//  PersonDetail.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/17.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;

@interface PersonDetail : NSManagedObject

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) Card *card;

@end
