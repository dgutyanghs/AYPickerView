//
//  HLPersonCellView.h
//  SmartCoach
//
//  Created by AlexYang on 15/8/3.
//  Copyright (c) 2015年 SmartCoach. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, HLPersonCellViewEnum) {
    HLPersonCellViewEnumAge,
    HLPersonCellViewEnumWeight,
    HLPersonCellViewEnumHeight,
};

@interface HLPersonCellView : UIView
+(instancetype)viewWithFrame:(CGRect)frame Name:(NSString *)name unit:(NSString *)unitStr valueRangeFromMin:(NSNumber *)min toMax:(NSNumber *)max defaultValue:(NSNumber *)defaultValue andOwner:(id<UIScrollViewDelegate>)owner type:(HLPersonCellViewEnum)type;

-(NSNumber *)updateLeftViewValue:(int16_t)contentOffsetX;


@property (nonatomic , strong) NSNumber *max;
@property (nonatomic , strong) NSNumber *min;
@property (nonatomic , strong) NSNumber *defaultValue;
@property (nonatomic , copy)   NSString *unitStr;
@property (nonatomic , copy)   NSString *name;
@property (nonatomic , assign) HLPersonCellViewEnum type;

/**
 *  color for ruler. scale
 */
@property (nonatomic , strong) UIColor *scaleColor;
@property (nonatomic , strong) UIColor *scaleBackgroundColor;
@property (nonatomic , strong) UIColor *scaleBorderColor;
@property (nonatomic , assign) CGFloat scaleBorderWidth;
@property (nonatomic , strong) UIColor *scaleCursorColor;
@property (nonatomic , strong) UIColor *resultTextColor;
@end
