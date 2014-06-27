//
//  KSGLeftMenuViewController.m
//  SampleREMenu
//
//  Created by Ryo Kosuge on 2014/06/24.
//  Copyright (c) 2014年 kosuge. All rights reserved.
//

#import "KSGLeftMenuViewController.h"
#import "UIViewController+RESideMenu.h"
#import "RESideMenu.h"

@interface KSGLeftMenuViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *data;

@end

@implementation KSGLeftMenuViewController

// static const NSTimeInterval kAnimationDuration = 0.3;
typedef NS_ENUM(NSInteger, KGSLeftMenuSelected) {
    KSGLeftMenuSelectedFirst,
    KSGLeftMenuSelectedSecond,
    KSGLeftMenuSelectedThird
};

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
    self.tableView.scrollsToTop = NO;
    [self.view addSubview:self.tableView];
    
    self.data = @[@"Low 1", @"Low 2", @"Low 3"];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case KSGLeftMenuSelectedFirst:
            NSLog(@"hoge");
            self.sideMenuViewController.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstContentViewController"];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case KSGLeftMenuSelectedSecond:
            NSLog(@"fuga");
            self.sideMenuViewController.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondContentViewController"];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case KSGLeftMenuSelectedThird:
            NSLog(@"bar");
            self.sideMenuViewController.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdContentViewController"];
            [self.sideMenuViewController hideMenuViewController];
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSString *text = self.data[indexPath.row];
    cell.textLabel.text = text;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
