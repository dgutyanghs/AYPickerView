//
//  HLMeasureView.h
//  scrollViewDrawLine
//
//  Created by  BlueYang on 15/8/2.
//  Copyright (c) 2015年  BlueYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLMeasureView : UIView
+(instancetype)viewWithFrame:(CGRect)frame valueRangeFrom:(NSNumber *)min toMax:(NSNumber *)max andStartPosition:(CGFloat)startPosition valueLabelColor:(UIColor *)color;
@end
