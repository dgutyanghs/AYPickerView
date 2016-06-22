//
//  AYPersonInfoController.m
//  AYPickerDataView
//
//  Created by AlexYang on 16/6/21.
//  Copyright © 2016年 AlexYang. All rights reserved.
//

#import "AYPersonInfoController.h"
#import "AYPickerDataView.h"

@interface AYPersonInfoController () <UIScrollViewDelegate>
@property (weak, nonatomic) HLPickerCellView *ageCellView;
//@property (weak, nonatomic) HLPersonCellView *weightCellView;
@property (weak, nonatomic) HLPickerCellView *heightCellView;
@end

@implementation AYPersonInfoController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initiaViewResource];
}

-(void)initiaViewResource
{
    self.view.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:214/255.0 alpha:1.0];
    
    CGFloat ageSelectH = 137/2 ;
    CGFloat ageSelectY = 76/2 ;
    
    HLPickerCellView *ageCellView =  [self createAgeInfoView:CGRectMake(0, ageSelectH + ageSelectY + 84/2, ScreenWidth, 110/2)];
    [self.view addSubview:ageCellView];
    self.ageCellView = ageCellView;

    
    CGFloat heightCellY = ageCellView.y  + ageCellView.height + 79/2;
    HLPickerCellView * heightCellView = [self createHeightInfoView:CGRectMake(0, heightCellY, ScreenWidth, 110/2)];
    [self.view addSubview:heightCellView];
    self.heightCellView = heightCellView;
}
/**
 *  个人信息项 年龄
 */
-(HLPickerCellView *)createAgeInfoView:(CGRect)frame
{
    HLPickerCellView *cellView = [HLPickerCellView viewWithFrame:frame Name:@"Age" unit:@"Year" valueRangeFromMin:@0 toMax:@100 defaultValue:@25 andOwner:self   type:HLPersonCellViewEnumAge];
    self.ageCellView.tag = HLPersonCellViewEnumAge;
    cellView.scaleBackgroundColor = [UIColor yellowColor];
    cellView.scaleColor = [UIColor blueColor];
    cellView.scaleBorderWidth = 3.0;
    cellView.scaleBorderColor = [UIColor cyanColor];
    cellView.scaleCursorColor = [UIColor redColor];
    cellView.resultTextColor = [UIColor magentaColor];
    
    return cellView;
}


/**
 *  个人信息项 身高
 */
-(HLPickerCellView *)createHeightInfoView:(CGRect)frame
{
    HLPickerCellView *cellView = [HLPickerCellView viewWithFrame:frame Name:@"身高" unit:@"cm" valueRangeFromMin:@0 toMax:@240 defaultValue:@172 andOwner:self type:HLPersonCellViewEnumHeight];
    self.heightCellView.tag = HLPersonCellViewEnumHeight;
    
    return cellView;
}


#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    switch (scrollView.tag) {
        case HLPersonCellViewEnumAge:
            [self.ageCellView updateLeftViewValue:scrollView.contentOffset.x];
            break;
        case HLPersonCellViewEnumHeight:
            [self.heightCellView updateLeftViewValue:scrollView.contentOffset.x];
            break;
//        case HLPersonCellViewEnumWeight:
//            [self.weightCellView updateLeftViewValue:scrollView.contentOffset.x];
//            break;
        default:
            break;
    }
    
    
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        int16_t x = (int16_t) (scrollView.contentOffset.x);
        int16_t newX = ((x )/10) *10;
        [UIView animateWithDuration:0.2 animations:^{
            
            scrollView.contentOffset = CGPointMake(newX, scrollView.contentOffset.y);
            // NSLog(@"decelerate is %d", decelerate);
            // NSLog(@"end decekerate x = %f", scrollView.contentOffset.x);
        }];
    }
}

// called when scroll view grinds to a halt

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int16_t x = (int16_t) (scrollView.contentOffset.x );
    int16_t newX = ((x)/10) *10;
    [UIView animateWithDuration:0.2 animations:^{
        
        scrollView.contentOffset = CGPointMake(newX, scrollView.contentOffset.y);
        //        NSLog(@"end decekerate x = %f", scrollView.contentOffset.x);
    }];
}

@end
