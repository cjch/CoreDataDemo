//
//  Card.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/17.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PersonDetail;

@interface Card : NSManagedObject

@property (nullable, nonatomic, retain) NSString *certificateID;
@property (nullable, nonatomic, retain) PersonDetail *personDetail;

@end
