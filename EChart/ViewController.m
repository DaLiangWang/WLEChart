//
//  ViewController.m
//  EChart
//
//  Created by 适途科技二 on 2019/4/9.
//  Copyright © 2019 WangLiang. All rights reserved.
//



#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WLEChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WLEChartView *view = [[WLEChartView alloc]initWithFrame:CGRectMake(0, 20, 300, 400)];
    [self.view addSubview:view];
    self.view.backgroundColor = [UIColor redColor];
}


@end
