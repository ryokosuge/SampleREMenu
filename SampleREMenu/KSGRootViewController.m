//
//  KSGRootViewController.m
//  SampleREMenu
//
//  Created by Ryo Kosuge on 2014/06/24.
//  Copyright (c) 2014年 kosuge. All rights reserved.
//

#import "KSGRootViewController.h"

@interface KSGRootViewController ()
@end

@implementation KSGRootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstContentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    self.backgroundImage = [UIImage imageNamed:@"MenuBackground"];
}

@end
