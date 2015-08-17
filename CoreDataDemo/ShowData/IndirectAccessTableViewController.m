//
//  IndirectAccessTableViewController.m
//  CoreDataDemo
//
//  Created by jiechen on 15/8/17.
//  Copyright © 2015年 jch. All rights reserved.
//

#import "IndirectAccessTableViewController.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"
#import "Card.h"

static NSString * const BasicCellIdentifier = @"BasicCell";

@interface IndirectAccessTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation IndirectAccessTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Indirect Access";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:BasicCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BasicCellIdentifier forIndexPath:indexPath];
    Card *card = self.dataArray[indexPath.row];
    cell.textLabel.text = card.certificateID;
    return cell;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc = [DetailViewController instance];
    vc.card = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - setter and getter
- (NSArray *)dataArray
{
    if (_dataArray) {
        return _dataArray;
    }
    
    _dataArray = [[CoreDataManager sharedManager] getAllCards];
    return _dataArray;
}

@end
