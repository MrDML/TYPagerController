//
//  CustomPagerController.m
//  TYPagerControllerDemo
//
//  Created by tany on 16/5/17.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import "CustomPagerController.h"
#import "CustomViewController.h"
#import "ListViewController.h"
#import "CollectionViewController.h"

@interface CustomPagerController ()

@end

@implementation CustomPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.adjustStatusBarHeight = YES;
    self.cellSpacing = 8;
    if (_variable) {
        self.progressBounces = NO;
        self.progressWidth = 0;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_showNavBar) {
        self.navigationController.navigationBarHidden = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (!_showNavBar) {
        self.navigationController.navigationBarHidden = NO;
    }
}

- (void)setBarStyle:(TYPagerBarStyle)barStyle
{
    [super setBarStyle:barStyle];
    
    if (barStyle == TYPagerBarStyleCoverView) {
        self.progressBounces = NO;
        self.progressHeight = self.contentTopEdging-8;
        self.progressEdging = -self.progressHeight/4;
        self.progressColor = [UIColor lightGrayColor];
    }else {
        self.progressBounces = YES;
        self.progressHeight = 2;
        self.progressEdging = 3;
        self.progressColor = [UIColor redColor];
    }
    self.progressRadius = self.progressHeight/2;
}


- (NSInteger)numberOfControllersInPagerController
{
    return 30;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index
{
    if (index%3 == 0) {
        CustomViewController *VC = [[CustomViewController alloc]init];
        VC.text = [@(index) stringValue];
        return VC;
    }else if (index%3 == 1) {
        ListViewController *VC = [[ListViewController alloc]init];
        VC.text = [@(index) stringValue];
        return VC;
    }else {
        CollectionViewController *VC = [[CollectionViewController alloc]init];
        VC.text = [@(index) stringValue];
        return VC;
    }
}

- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index
{
    return index %2 == 0 ? [NSString stringWithFormat:@"Tab %ld",index]:[NSString stringWithFormat:@"Tab Tab %ld",index];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end