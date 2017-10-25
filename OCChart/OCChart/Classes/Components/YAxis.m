//
//  YAxis.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "YAxis.h"

@implementation YAxis

-(id)init
{
    if (self = [super init]) {
        self.drawBottomYLabelEntryEnabled = YES;
        self.drawTopYLabelEntryEnabled = YES;
        self.inverted = NO;
        self.drawZeroLineEnabled = NO;
        self.zeroLineColor = [UIColor grayColor];
        self.zeroLineWidth = 1.0f;
        self.zeroLineDashPhase = 0;
        self.zeroLineDashLengths = @[];
        self.spaceTop = 0.1;
        self.yOffset = 0;
    }
    return self;
}

-(CGSize)requiredSize
{
//    let label = getLongestLabel() as NSString
//    var size = label.size(attributes: [NSFontAttributeName: labelFont])
//    size.width += xOffset * 2.0
//    size.height += yOffset * 2.0
//    size.width = max(minWidth, min(size.width, maxWidth > 0.0 ? maxWidth : size.width))
//    return size
    CGSize size = CGSizeZero;
    size.width += self.xOffset *2.0;
    size.height += self.yOffset * 2.0;
    size.width = MAX(self.minWidth, MIN(size.width, self.maxWidth > 0.0 ? self.maxWidth : size.width));
    return size;
}

-(id)initPosition:(AxisDependency)position
{
    if (self = [self init]) {
        self.axisDependency = position;
    }
    return self;
}

-(void)calculate:(double)dataMin :(double)dataMax
{
    
}

@end
