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
@end
