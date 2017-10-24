//
//  BarLineChartViewBase.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarLineChartViewBase.h"

@implementation BarLineChartViewBase

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.maxVisibleCount = 100;
        self.autoScaleMinMaxEnabled = NO;
    }
    return self;
}

@end
