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
//@property (strong, nonatomic)NSNumber *defaultValue;
@property (assign, nonatomic)CGFloat defaultOffSetX;

@property (nonatomic , assign)id < UIScrollViewDelegate> owner;
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


-(void)setDefaultParameter {
    _scaleColor = [UIColor grayColor];
    _scaleBackgroundColor = [UIColor whiteColor];
    _scaleBorderColor = [UIColor greenColor];
    _scaleCursorColor = _scaleBorderColor;
    _scaleBorderWidth = 3.0;
    _resultTextColor  = [UIColor whiteColor];
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setDefaultParameter];
    }
    
    return self;
}

+(instancetype)viewWithFrame:(CGRect)frame Name:(NSString *)name unit:(NSString *)unitStr valueRangeFromMin:(NSNumber *)min toMax:(NSNumber *)max defaultValue:(NSNumber *)defaultValue andOwner:(id<UIScrollViewDelegate>)owner type:(HLPersonCellViewEnum)type
{
    HLPersonCellView *cellView = [[HLPersonCellView alloc] initWithFrame:frame];
    cellView.name = name;
    cellView.unitStr = unitStr;
    cellView.min = min;
    cellView.max = max;
    cellView.defaultValue = defaultValue;
    cellView.owner = owner;
    cellView.type = type;
    
    return cellView;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat leftViewX = 0;
    CGFloat leftViewY = 0;
    CGFloat leftViewW = 109/2;
    CGFloat leftViewH = 110/2;
    CGFloat padding = 10;
    UInt16 centerDistance = 10;
    HLPersonItemInfoView *leftView = [HLPersonItemInfoView viewWithFrame:CGRectMake(leftViewX, leftViewY, leftViewW- padding, leftViewH) itemName:_name Unit:_unitStr andValue:_defaultValue andTextColor:_resultTextColor];
    [self addSubview:leftView];
    self.leftView = leftView;
    
    //尺子scrollView
    CGFloat valueW = ScreenWidth - leftViewX - leftViewW  - 47/2 ;
    HLPickerScrollView *valueScrollView = [HLPickerScrollView viewWithFrame:CGRectMake(leftViewW, 0, valueW, leftViewH) valueDefault:_defaultValue RangeFrom:_min toMax:_max];
    valueScrollView.scaleColor = _scaleColor;
    valueScrollView.backgroundColor = _scaleBackgroundColor;
    valueScrollView.layer.borderColor = [_scaleBorderColor CGColor];
    valueScrollView.layer.borderWidth = _scaleBorderWidth;
    
    NSInteger offsetX = ([_defaultValue intValue] - 1 - centerDistance) * 10;
    self.defaultOffSetX = offsetX;
    valueScrollView.contentOffset = CGPointMake(offsetX, 0);
    valueScrollView.delegate = _owner;
    valueScrollView.tag = _type;
    [self addSubview:valueScrollView];
    self.valueScrollView = valueScrollView;
    
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
    slayer.fillColor = _scaleCursorColor.CGColor;
    slayer.path = path.CGPath;
    [self.layer addSublayer:slayer];
}

@end
