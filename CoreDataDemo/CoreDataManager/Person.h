//
//  Person.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * certificateID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * age;

@end
