//
//  WaterWaveView.m
//  WaterWave
//
//  Created by WilliamsDu on 16/7/19.
//  Copyright © 2016年 杜宇. All rights reserved.
//

#import "DYWaterWaveView.h"

#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
#define  waveSpeed 0.1

@interface DYWaterWaveView ()

@property (nonatomic, strong) UILabel *textFrontLabel;

@property (nonatomic, strong) CAShapeLayer *waveLayer;
@property (nonatomic, strong) CADisplayLink *playLink;
@property (nonatomic,assign) CGFloat waveWidth;
@property (nonatomic,assign) CGFloat waveHeight;
@property (nonatomic,assign) CGFloat waveHorizonlLine;

@property (nonatomic, assign) CGFloat offset;
@end

@implementation DYWaterWaveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.waveWidth = frame.size.width;
        self.waveHorizonlLine = frame.size.height/2;
        self.waveHeight = 20;
        self.backgroundColor = [UIColor whiteColor];
        
        
        self.textBackLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _waveHorizonlLine-_waveHeight, frame.size.width, _waveHeight)];
        self.textBackLabel.text = @"南海是中国的";
        self.textBackLabel.textAlignment = NSTextAlignmentCenter;
        self.textBackLabel.font = [UIFont systemFontOfSize:50];
        self.textBackLabel.textColor = [UIColor redColor];
        
        [self addSubview:_textBackLabel];
        
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor greenColor];
        [self addSubview:view];
        self.textFrontLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _waveHorizonlLine-_waveHeight, frame.size.width, _waveHeight)];
        self.textFrontLabel.text = @"南海是中国的";
        self.textFrontLabel.textAlignment = NSTextAlignmentCenter;
        self.textFrontLabel.font = [UIFont systemFontOfSize:50];
        self.textFrontLabel.textColor = [UIColor whiteColor];
        [view addSubview:_textFrontLabel];

        
        self.waveLayer = [CAShapeLayer new];
        self.waveLayer.lineWidth = 3;
        self.waveLayer.strokeColor = [UIColor greenColor].CGColor;
        view.layer.mask = _waveLayer;
    }
    return self;
}

- (void)wave
{
    _playLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startWaveAnimation)];
    [_playLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)startWaveAnimation {

        _offset += waveSpeed;
        //设置第一条波曲线的路径
        CGMutablePathRef pathRef = CGPathCreateMutable();
        //第一个波的公式
        for (CGFloat x = 0; x < _waveWidth; x++) {
            CGFloat y = _waveHeight*sinf(2*M_PI*x/_waveWidth + _offset) + _waveHorizonlLine;
            if (x==0) {
                 CGPathMoveToPoint(pathRef, NULL, 0, y);
            } else {
                CGPathAddLineToPoint(pathRef, NULL, x, y);
            }
            
        }
        CGPathAddLineToPoint(pathRef, NULL, _waveWidth, _waveHorizonlLine*2);
        CGPathAddLineToPoint(pathRef, NULL, 0, _waveHorizonlLine*2);
        CGPathCloseSubpath(pathRef);
        //设置第一个波layer的path
        _waveLayer.path = pathRef;
        _waveLayer.fillColor = [UIColor blackColor].CGColor;//任意非透明颜色
        CGPathRelease(pathRef);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
