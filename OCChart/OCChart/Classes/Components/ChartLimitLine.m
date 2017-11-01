//
//  ChartLimitLine.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartLimitLine.h"

@implementation ChartLimitLine

-(id)init
{
    if (self = [super init]) {
        self.label = @"";
        self.labelPosition = rightTop;
        self.drawLabelEnabled = YES;
        self.valueTextColor = [UIColor blackColor];
    }
    return self;
}

@end
