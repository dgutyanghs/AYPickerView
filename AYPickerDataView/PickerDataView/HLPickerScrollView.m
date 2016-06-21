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
@end

@implementation HLPickerScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
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
    
    CGFloat startPoint;
    
    if (UI_IS_IPHONE5) {
        startPoint = 11;
    }else if (UI_IS_IPHONE6) {
        startPoint = 38.5;
    } else if (UI_IS_IPHONE6PLUS) {
        startPoint = 58;
    } else {
        startPoint = 11;
        NSLog(@"undefine iPhone screen");
    }

    pickerScroll.contentInset = UIEdgeInsetsMake(0, (frame.size.width / 2) - startPoint, 0, frame.size.width/2 + startPoint + 2);
    
    HLMeasureView *measureView = [HLMeasureView viewWithFrame:CGRectMake(0, 0, W, frame.size.height) valueRangeFrom:min toMax:max andStartPosition:startPoint];
    pickerScroll.measureView = measureView;
    [pickerScroll addSubview:measureView];
    
    return pickerScroll;
}



@end
