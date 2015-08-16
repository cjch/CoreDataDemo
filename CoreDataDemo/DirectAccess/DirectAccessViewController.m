//
//  DirectAccessViewController.m
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import "DirectAccessViewController.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"
#import "Person.h"

static NSString * const BasicCellIdentifier = @"BasicCell";

@interface DirectAccessViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation DirectAccessViewController

+ (instancetype)instance
{
    DirectAccessViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DirectAccessViewControllerID"];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Direct Access";
    //MARK:tableView显示时顶部存在一个空白行，不知道是什么原因？
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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
    Person *person = self.dataArray[indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.address;
    return cell;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc = [DetailViewController instance];
    vc.person = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - setter and getter
- (NSArray *)dataArray
{
    if (_dataArray) {
        return _dataArray;
    }
    
    _dataArray = [[CoreDataManager sharedManager] getAllPersons];
    return _dataArray;
}

@end
