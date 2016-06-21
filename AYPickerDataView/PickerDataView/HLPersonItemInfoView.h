//
//  HLPersonInfoView.h
//  SmartCoach
//
//  Created by AlexYang on 15/7/31.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLPersonItemInfoView : UIView
@property (weak, nonatomic) UILabel *itemNameLabel;
@property (weak, nonatomic) UILabel *itemValueLabel;
@property (weak, nonatomic) UILabel *itemUnitLabel;
@property (strong, nonatomic)NSNumber *itemValue;


+(instancetype)viewWithFrame:(CGRect)frame itemName:(NSString *)name Unit:(NSString *)unit andValue:(NSNumber *)value;
+(instancetype)viewWithFrame:(CGRect)frame itemName:(NSString *)name Unit:(NSString *)unit andValue:(NSNumber *)value andTextColor:(UIColor *)textColor;

@end
