//
//  DetailViewController.h
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@class Card;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) Card *card;

+ (instancetype)instance;

@end
