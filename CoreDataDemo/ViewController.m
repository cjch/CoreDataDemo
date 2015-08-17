//
//  ViewController.m
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import "ViewController.h"
#import "DirectAccessViewController.h"
#import "IndirectAccessTableViewController.h"

@interface ViewController ()

- (IBAction)onDirectAccessButtonPressed:(UIButton *)sender;
- (IBAction)onIndirectAccessButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"CoreData Demo";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDirectAccessButtonPressed:(UIButton *)sender {
    DirectAccessViewController *vc = [DirectAccessViewController instance];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onIndirectAccessButtonPressed:(UIButton *)sender {
    IndirectAccessTableViewController *vc = [IndirectAccessTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
