//
//  ViewController.m
//  CoreGraphics
//
//  Created by 陈诚 on 16/3/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "CCCGContextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCustomView];
}

- (void)loadCustomView
{
    CCCGContextView *ccView = [[CCCGContextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:ccView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
