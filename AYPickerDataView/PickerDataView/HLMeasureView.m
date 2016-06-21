//
//  MeasureView.m
//  scrollViewDrawLine
//
//  Created by  BlueYang on 15/8/2.
//  Copyright (c) 2015年  BlueYang. All rights reserved.
//

#import "HLMeasureView.h"
#import "UILabel+StringFrame.h"
#import "const.h"




@interface HLMeasureView ()
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, assign) NSInteger startPosition;
@end

@implementation HLMeasureView

+(instancetype)viewWithFrame:(CGRect)frame valueRangeFrom:(NSNumber *)min toMax:(NSNumber *)max andStartPosition:(CGFloat)startPosition
{
    CGRect viewFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width + startPosition, frame.size.height);
    HLMeasureView * measureView = [[HLMeasureView alloc] initWithFrame:viewFrame];
    measureView.startPosition = startPosition;
    measureView.labels = [NSMutableArray array];
    
    UILabel *titleLabel = nil;
    UInt8 count = ([max intValue]- [min intValue])/10;
    for (int i =0; i <= count; i++) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:17.0];
        titleLabel.text = [NSString stringWithFormat:@"%d",[min intValue] + 10*i];
        
        [measureView.labels addObject:titleLabel];
        [measureView addSubview:titleLabel];
    }


    return measureView;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



/**
 *  画标尺
 */
- (void)drawRect:(CGRect)rect
{
    UInt16 extensionLenght = 0;
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int i = 0; i < rect.size.width / 10; i ++) {
        // 设置起点
        [path moveToPoint:CGPointMake(self.startPosition + i*10, 0)];
        
        // 添加一条线到某个点
        if ((i % 10) == 0) {
            extensionLenght = 10;
        } else if ((i%5) == 0) {
            extensionLenght = 5;
        } else {
            extensionLenght = 0;
        }
        [path addLineToPoint:CGPointMake(self.startPosition + i*10, 12 + extensionLenght)];
    }

    
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 设置绘图状态
    // 设置线宽
    CGContextSetLineWidth(ctx, 1);
    [[UIColor grayColor] set];
    
    // 4.渲染上下文到视图
    CGContextStrokePath(ctx);
}

-(void)layoutSubviews
{
    UILabel *titleLabel = nil;
    for (int i = 0; i < _labels.count; i++) {
        titleLabel = _labels[i];
        CGSize titleSize = [titleLabel boundingRectWithSize:CGSizeMake(0, 0)];
        titleLabel.bounds = CGRectMake(0, 0, titleSize.width, titleSize.height);
        titleLabel.center =CGPointMake(self.startPosition +10 * i*10, 38.5);
        
    }
}

@end
