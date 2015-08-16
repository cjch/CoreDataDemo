//
//  DetailViewController.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Person *person;

+ (instancetype)instance;

@end
