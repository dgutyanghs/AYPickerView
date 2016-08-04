//
//  HLPickerCellView.m
//  SmartCoach
//
//  Created by AlexYang on 15/8/3.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import "HLPickerCellView.h"
#import "HLPickerScrollView.h"
#import "HLPickerResultView.h"
#import "const.h"

@interface HLPickerCellView ()
@property (weak, nonatomic) HLPickerScrollView *valueScrollView;
@property (weak, nonatomic) HLPickerResultView *leftView;
@property (weak, nonatomic) UIImageView *borderView;
//@property (strong, nonatomic)NSNumber *defaultValue;
@property (assign, nonatomic)CGFloat defaultOffSetX;

@property (nonatomic , assign)id < UIScrollViewDelegate> owner;
@end

@implementation HLPickerCellView

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
    _gradientEnable    = NO;
    _gradientColorCenter = [UIColor colorWithWhite:0.0 alpha:0.8];
    _gradientColorCorner = [UIColor colorWithWhite:0.0 alpha:0.0];
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setDefaultParameter];
    }
    
    return self;
}

+(instancetype)viewWithFrame:(CGRect)frame Name:(NSString *)name unit:(NSString *)unitStr valueRangeFromMin:(NSNumber *)min toMax:(NSNumber *)max defaultValue:(NSNumber *)defaultValue andOwner:(id<UIScrollViewDelegate>)owner type:(HLPersonCellViewEnum)type
{
    HLPickerCellView *cellView = [[HLPickerCellView alloc] initWithFrame:frame];
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
    HLPickerResultView *leftView = [HLPickerResultView viewWithFrame:CGRectMake(leftViewX, leftViewY, leftViewW- padding, leftViewH) itemName:_name Unit:_unitStr andValue:_defaultValue andTextColor:_resultTextColor];
    [self addSubview:leftView];
    self.leftView = leftView;
    
    //尺子scrollView
    CGFloat valueW = ScreenWidth - leftViewX - leftViewW  - 47/2 ;
    HLPickerScrollView *valueScrollView = [HLPickerScrollView viewWithFrame:CGRectMake(leftViewW, 0, valueW, leftViewH) valueDefault:_defaultValue RangeFrom:_min toMax:_max andScaleColor:_scaleColor];
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
    
    if (_gradientEnable) {
        [self addGradientLayer:valueScrollView.frame];
    }
    
    //游标指示框
    CGFloat cursorW = 8.0;
    CGFloat cursorH = 10.0;
    CGFloat cursorDelta = 0.0;
    if (UI_IS_IPHONE5 || UI_IS_IPHONE6PLUS) {
        cursorDelta = 0.5;
    } else if (UI_IS_IPHONE6){
        cursorDelta = 0.0;
    }else {
        cursorDelta = 0.0;
    }
    
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

-(void)addGradientLayer:(CGRect)frame {
    CAGradientLayer *gLayer = [[CAGradientLayer alloc] init];
    gLayer.frame = frame;
    gLayer.colors = @[(__bridge id)_gradientColorCorner.CGColor,
                      (__bridge id)_gradientColorCenter.CGColor,
                      (__bridge id)_gradientColorCorner.CGColor];
    gLayer.locations = @[@0.0, @0.5, @1.0];
    gLayer.startPoint = CGPointMake(0, 0.5);
    gLayer.endPoint  =  CGPointMake(1, 0.5);
    
    [self.layer addSublayer:gLayer];
}

@end
