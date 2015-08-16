//
//  CoreDataManager.m
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "Person.h"

static NSString * const AppExistTestDatakey = @"app.exist.test.data";

@interface CoreDataManager ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CoreDataManager

+ (instancetype)sharedManager
{
    static CoreDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CoreDataManager alloc]init];
        
        //添加测试数据(只添加一次)
        if (![[NSUserDefaults standardUserDefaults] boolForKey:AppExistTestDatakey]) {
            [manager addTestData];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:AppExistTestDatakey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    });
    
    return manager;
}

- (void)addTestData
{
    NSArray *certificates = @[@"11111", @"62312", @"46514", @"85378", @"26523"];
    NSArray *names = @[@"ads", @"da", @"te", @"ys", @"fgi"];
    NSArray *addresses = @[@"aklfjakljlfajl", @"badafaafaf", @"ceghsfsjgs", @"dsdsfrtw4", @"efgsfag"];
    NSArray *ages = @[@12, @45, @23, @33, @22];
    
    [certificates enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
        person.certificateID = obj;
        person.name = names[idx];
        person.address = addresses[idx];
        person.age = ages[idx];
        
        NSError *error = nil;
        if (![self.managedObjectContext save:&error]) {
            [NSException raise:@"添加数据错误" format:@"%@", error.localizedDescription];
        }
    }];
}

#pragma mark - public method
- (NSArray *)getAllPersons
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    NSError *error = nil;
    NSArray *persons = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"添加数据错误" format:@"%@", error.localizedDescription];
    }
    
    return persons;
}

#pragma mark - setter and getter
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
    NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *storeUrl = [NSURL fileURLWithPath:[dirPath stringByAppendingPathComponent:@"CoreDataDemo.sqlite"]];
    NSError *error = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        [NSException raise:@"初始化数据存储错误" format:@"%@", error.localizedDescription];
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"CoreDataDemo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:fileUrl];
    return _managedObjectModel;
}

@end
