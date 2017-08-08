//
//  ViewController.m
//  WaterWave
//
//  Created by WilliamsDu on 16/7/19.
//  Copyright © 2016年 杜宇. All rights reserved.
//

#import "ViewController.h"
#import "DYWaterWaveView.h"

#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    DYWaterWaveView *waveView = [[DYWaterWaveView alloc] initWithFrame:CGRectMake(0, 100, SYS_DEVICE_WIDTH, 400)];
    [self.view addSubview:waveView];
    [waveView wave];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
