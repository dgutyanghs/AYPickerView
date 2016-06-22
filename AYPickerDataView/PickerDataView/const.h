//
//  const.h
//  BLuetoothTest
//
//  Created by AlexYang on 15/11/4.
//  Copyright © 2015年 AlexYang. All rights reserved.
//

#ifndef const_h
#define const_h

#import "UILabel+StringFrame.h"
#import "UIView+Extension.h"

#define ScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)

#define UI_IS_IPHONE5           ([[UIScreen mainScreen] bounds].size.height == 568.0)
#define UI_IS_IPHONE6           ([[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS       ([[UIScreen mainScreen] bounds].size.height == 736.0)

#endif /* const_h */
