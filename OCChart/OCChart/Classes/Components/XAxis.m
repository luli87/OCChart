//
//  XAxis.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "XAxis.h"

@implementation XAxis
-(id)init
{
    if (self = [super init]) {
        self.yOffset = 4.0;
        self.labelWidth = 1.0;
        self.labelHeight = 1.0;
        self.labelRotatedWidth = 1.0;
        self.labelRotatedWidth = 1.0;
        self.avoidFirstLastClippingEnabled = NO;
        self.labelPosition = top;
        self.wordWrapEnabled = NO;
        self.wordWrapWidthPercent = 1.0;
    }
    return self;
}
@end
