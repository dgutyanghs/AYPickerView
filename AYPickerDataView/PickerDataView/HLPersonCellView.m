//
//  HLPersonCellView.m
//  SmartCoach
//
//  Created by AlexYang on 15/8/3.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import "HLPersonCellView.h"
#import "HLPickerScrollView.h"
#import "HLPersonItemInfoView.h"
#import "const.h"

@interface HLPersonCellView ()
@property (weak, nonatomic) HLPickerScrollView *valueScrollView;
@property (weak, nonatomic) HLPersonItemInfoView *leftView;
@property (weak, nonatomic) UIImageView *borderView;
@property (strong, nonatomic)NSNumber *defaultValue;
@property (assign, nonatomic)CGFloat defaultOffSetX;

@end

@implementation HLPersonCellView

-(NSNumber *)updateLeftViewValue:(int16_t)contentOffsetX
{
    CGFloat newOffsetX = 0;
    newOffsetX = contentOffsetX - self.defaultOffSetX;
    int16_t x = (int16_t) (newOffsetX);
    int16_t newX = ((x )/10);
    self.leftView.itemValue = [NSNumber numberWithInt:newX + [self.defaultValue intValue]];
    return self.leftView.itemValue;
}


+(instancetype)viewWithFrame:(CGRect)frame Name:(NSString *)name unit:(NSString *)unitStr valueRangeFromMin:(NSNumber *)min toMax:(NSNumber *)max defaultValue:(NSNumber *)defaultValue andOwner:(id<UIScrollViewDelegate>)owner type:(HLPersonCellViewEnum)type
{
    HLPersonCellView *cellView = [[HLPersonCellView alloc] initWithFrame:frame];
    
    CGFloat leftViewX = 0;
    CGFloat leftViewY = 0;
    CGFloat leftViewW = 109/2;
    CGFloat leftViewH = 110/2;
    CGFloat padding = 10;
    UInt16 centerDistance = 10;
    HLPersonItemInfoView *leftView = [HLPersonItemInfoView viewWithFrame:CGRectMake(leftViewX, leftViewY, leftViewW- padding, leftViewH) itemName:name Unit:unitStr andValue:defaultValue];
    [cellView addSubview:leftView];
    cellView.leftView = leftView;
    
    //尺子scrollView
    CGFloat valueW = ScreenWidth - leftViewX - leftViewW  - 47/2 ;
    HLPickerScrollView *valueScrollView = [HLPickerScrollView viewWithFrame:CGRectMake(leftViewW, 0, valueW, leftViewH) valueDefault:defaultValue RangeFrom:min toMax:max];
    valueScrollView.backgroundColor = [UIColor whiteColor];
    valueScrollView.layer.borderColor = [[UIColor greenColor] CGColor];
    valueScrollView.layer.borderWidth = 3.0;
    
    NSInteger offsetX = ([defaultValue intValue] - 1 - centerDistance) * 10;
    cellView.defaultOffSetX = offsetX;
    cellView.defaultValue = defaultValue;
    valueScrollView.contentOffset = CGPointMake(offsetX, 0);
    valueScrollView.delegate = owner;
    valueScrollView.tag = type;
    [cellView addSubview:valueScrollView];
    cellView.valueScrollView = valueScrollView;
    
    //游标指示框
    CGFloat cursorW = 8.0;
    CGFloat cursorH = 10.0;
    CGFloat cursorDelta = 0.5;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((valueScrollView.width - cursorW) /2 + valueScrollView.x, 0)];
    [path addLineToPoint:CGPointMake((valueScrollView.width + cursorW) /2 + valueScrollView.x, 0)];
    [path addLineToPoint:CGPointMake(valueScrollView.width / 2 + valueScrollView.x - cursorDelta, cursorH)];
    [path closePath];
    
    CAShapeLayer *slayer = [[CAShapeLayer alloc] init];
    slayer.fillColor = [UIColor greenColor].CGColor;
    slayer.path = path.CGPath;
    [cellView.layer addSublayer:slayer];
    
    return cellView;
}


@end
