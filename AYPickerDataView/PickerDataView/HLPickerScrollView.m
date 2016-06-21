//
//  HLPersonInfoValueScrollView.m
//  SmartCoach
//
//  Created by AlexYang on 15/7/31.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import "HLPickerScrollView.h"
#import "HLMeasureView.h"
#import "const.h"

@interface HLPickerScrollView ()
@property (nonatomic, weak) HLMeasureView *measureView;
@property (nonatomic , strong) NSNumber *max;
@property (nonatomic , strong) NSNumber *min;
@property (nonatomic , assign) CGFloat startPoint;
@end

@implementation HLPickerScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setDefaultParameters];
    }
    return self;
}

-(void)setDefaultParameters {
    
    if (UI_IS_IPHONE5) {
        _startPoint = 11;
    }else if (UI_IS_IPHONE6) {
        _startPoint = 38.5;
    } else if (UI_IS_IPHONE6PLUS) {
        _startPoint = 58;
    } else {
        _startPoint = 11;
        NSLog(@"undefine iPhone screen");
    }
    _scaleColor = [UIColor grayColor];
}

+(instancetype)viewWithFrame:(CGRect)frame valueDefault:(NSNumber *)value RangeFrom:(NSNumber *)min toMax:(NSNumber *)max
{
    const NSInteger unitPerPixel = 10;
    HLPickerScrollView *pickerScroll = [[HLPickerScrollView alloc] initWithFrame:frame];
    CGFloat W  = ([max intValue]- [min intValue])*unitPerPixel;
    pickerScroll.contentSize = CGSizeMake(W, frame.size.height);
    pickerScroll.alwaysBounceHorizontal = YES;
    pickerScroll.bounces = YES;
    pickerScroll.scrollEnabled = YES;
    pickerScroll.showsHorizontalScrollIndicator = NO;
    pickerScroll.max = max;
    pickerScroll.min = min;
    
    return pickerScroll;
}


-(void)layoutSubviews {
    [super layoutSubviews];
    

    self.contentInset = UIEdgeInsetsMake(0, (self.frame.size.width / 2) - _startPoint, 0, self.frame.size.width/2 + _startPoint + 2);
    
    HLMeasureView *measureView = [HLMeasureView viewWithFrame:CGRectMake(0, 0, self.contentSize.width, self.frame.size.height) valueRangeFrom:_min toMax:_max andStartPosition:_startPoint valueLabelColor:_scaleColor];
    self.measureView = measureView;
    [self addSubview:measureView];
}

@end
