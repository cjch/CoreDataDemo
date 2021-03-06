//
//  DetailViewController.m
//  CoreDataDemo
//
//  Created by jiechen on 15/8/16.
//  Copyright © 2015年 jch. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"
#import "Card.h"
#import "PersonDetail.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *certificateLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation DetailViewController

+ (instancetype)instance
{
    DetailViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailViewControllerID"];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Person";
    //如果不再次设置person，view就不会显示person的详细信息。可能原因在上一级viewController中执行person的set方法时，view还没有加载好，因此view的更新不会起作用？
    [self displayDetailInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - show detail
- (void)displayDetailInfo
{
    if (self.person) {
        [self setPerson:self.person];
    }
    else{
        [self setCard:self.card];
    }
}

- (void)setPerson:(Person *)person
{
    _person = person;
    
    //显示详细信息
    self.nameLabel.text         = person.name;
    self.certificateLabel.text  = person.certificateID;
    self.ageLabel.text          = person.age.stringValue;
    self.addressLabel.text      = person.address;
}

- (void)setCard:(Card *)card
{
    _card = card;
    //显示详细信息
    self.nameLabel.text         = card.personDetail.name;
    self.certificateLabel.text  = card.certificateID;
    self.ageLabel.text          = card.personDetail.age.stringValue;
    self.addressLabel.text      = card.personDetail.address;
}

@end
