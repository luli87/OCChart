//
//  ChartViewBase.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartViewBase.h"

@implementation ChartViewBase

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)initialize
{
    
}

-(void)setExtraOffsets:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom
{
    self.extraLeftOffset = left;
    self.extraTopOffset = top;
    self.extraRightOffset = right;
    self.extraBottomOffset = bottom;
}

@end
