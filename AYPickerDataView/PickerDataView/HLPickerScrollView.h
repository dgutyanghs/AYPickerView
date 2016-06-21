//
//  HLPersonInfoValueScrollView.h
//  SmartCoach
//
//  Created by AlexYang on 15/7/31.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLPickerScrollView : UIScrollView
+(instancetype)viewWithFrame:(CGRect)frame valueDefault:(NSNumber *)value RangeFrom:(NSNumber *)min toMax:(NSNumber *)max ;

/**
 *  color for ruler. scale
 */
@property (nonatomic , strong) UIColor *scaleColor;
@end
