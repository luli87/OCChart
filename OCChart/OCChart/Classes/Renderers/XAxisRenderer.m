//
//  XAxisRenderer.m
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "XAxisRenderer.h"

@implementation XAxisRenderer
-(id)init
{
    if (self = [super init]) {
        _axisLineSegmentsBuffer = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],[NSValue valueWithCGPoint:CGPointMake(0, 0)]];
    }
    return self;
}
-(void)renderAxisLine:(CGContextRef)context
{
    if (![self.axis isMemberOfClass:[XAxis class]] || !self.viewPortHandler) {
        return;
    }
    XAxis *xAxis = (self.axis);
    if (!self.axis.enabled || !self.axis.drawAxisLineEnabled) {
        return;
    }
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context,xAxis.axisLineColor.CGColor);
    CGContextSetLineWidth(context, xAxis.axisLineWidth);
    if (xAxis.axisLineDashLengths.count > 0) {
        CGFloat dashs[xAxis.axisLineDashLengths.count];
        for (int i = 0; i < xAxis.axisLineDashLengths.count; i++) {
            CGFloat value = [xAxis.axisLineDashLengths[i] floatValue];
            dashs[i] = value;
        }
        CGContextSetLineDash(context, xAxis.axisLineDashPhase, dashs, xAxis.axisLineDashLengths.count);
    } else {
        CGFloat dashs[0];
        CGContextSetLineDash(context, 0, dashs, 0);
    }
    if (xAxis.labelPosition == top
        || xAxis.labelPosition == topInside
        || xAxis.labelPosition == bothSided) {
        _axisLineSegmentsBuffer = @[[NSValue valueWithCGPoint:CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentTop)],[NSValue valueWithCGPoint:CGPointMake(self.viewPortHandler.contentRight, self.viewPortHandler.contentTop)]];
        CGPoint points[] = {CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentTop),CGPointMake(self.viewPortHandler.contentRight, self.viewPortHandler.contentTop)};
        CGContextStrokeLineSegments(context, points, 2);
    }
    if (xAxis.labelPosition == bottom
        || xAxis.labelPosition == bottomInside
        || xAxis.labelPosition == bothSided) {
        _axisLineSegmentsBuffer = @[[NSValue valueWithCGPoint:CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentBottom)],[NSValue valueWithCGPoint:CGPointMake(self.viewPortHandler.contentRight, self.viewPortHandler.contentBottom)]];
         CGPoint points[] = {CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentBottom),CGPointMake(self.viewPortHandler.contentRight, self.viewPortHandler.contentBottom)};
        CGContextStrokeLineSegments(context,points, 2);
    }
    CGContextRestoreGState(context);
}
@end
