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

-(void)initialize
{
    [super initialize];
    self.leftAxis = [[YAxis alloc] initPosition:left];
    self.rightAxis = [[YAxis alloc] initPosition:right];
    self.leftAxisTransformer = [[Transformer alloc] initViewPortHandler:self.viewPortHandler];
    self.rightAxisTransformer = [[Transformer alloc] initViewPortHandler:self.viewPortHandler];
    self.leftYAxisRenderer = [[YAxisRenderer alloc] init:self.viewPortHandler axis:self.leftAxis transformer:self.leftAxisTransformer];
    self.rightYAxisRenderer = [[YAxisRenderer alloc] init:self.viewPortHandler axis:self.rightAxis transformer:self.rightAxisTransformer];
    self.xAxisRenderer = [[XAxisRenderer alloc] init:self.viewPortHandler axis:self.leftAxis transformer:self.leftAxisTransformer];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    CGPoint oldPoint = CGPointZero;
    if (self.keepPositionOnRotation && ([keyPath isEqualToString:@"bounds"] || [keyPath isEqualToString:@"frame"])) {
        oldPoint = self.viewPortHandler.contentRect.origin;
        [[self getTransformer:left] pixelToValues:&oldPoint];
    }

    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    CGPoint newPoint = CGPointMake(oldPoint.x, oldPoint.y);
    if (self.keepPositionOnRotation) {
        [[self getTransformer:left] pixelToValues:&newPoint];
        [self.viewPortHandler centerViewPort:newPoint chart:self];
    } else {
        [self.viewPortHandler refresh:self.viewPortHandler.touchMatrix chart:self invalidate:YES];
    }
}

-(Transformer *)getTransformer:(AxisDependency)axis
{
    if (axis == left) {
        return self.leftAxisTransformer;
    } else {
        return self.rightAxisTransformer;
    }
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (!self.data) {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        return;
    }
    [self drawGridBackground:context];
    if (self.autoScaleMinMaxEnabled) {
        [self autoScale];
    }
    if (self.leftAxis.enabled) {
        [self.leftYAxisRenderer computeAxis:self.leftAxis.axisMiniMum max:self.leftAxis.axisMaxiMum inverted:self.leftAxis.inverted];
    }
    if (self.rightAxis.enabled) {
        [self.rightYAxisRenderer computeAxis:self.rightAxis.axisMiniMum max:self.rightAxis.axisMaxiMum inverted:self.rightAxis.inverted];
    }
    if (self.xAxis.enabled) {
        [self.xAxisRenderer computeAxis:self.xAxis.axisMiniMum max:self.xAxis.axisMaxiMum inverted:NO];
    }
    [self.xAxisRenderer renderAxisLine:context];
    [self.leftYAxisRenderer renderAxisLine:context];
    [self.rightYAxisRenderer renderAxisLine:context];
    if (self.xAxis.enabled && self.xAxis.drawLimitLinesBehindDataEnabled) {
        [self.xAxisRenderer renderAxisLine:context];
    }
    if (self.leftAxis.enabled && self.leftAxis.drawLimitLinesBehindDataEnabled) {
        [self.leftYAxisRenderer renderLimitLines:context];
    }
    if (self.rightAxis.enabled && self.rightAxis.drawLimitLinesBehindDataEnabled) {
        [self.rightYAxisRenderer renderLimitLines:context];
    }
    CGContextSaveGState(context);
    CGContextClipToRect(context, self.viewPortHandler.contentRect);
    [self.renderer drawData:context];
}

-(void)drawGridBackground:(CGContextRef)context
{
    if (self.drawGridBackgroundEnabled || self.drawBordersEnabled) {
        CGContextSaveGState(context);
    }
    if (self.drawGridBackgroundEnabled) {
        CGContextSetFillColorWithColor(context, self.gridBackgroundColor.CGColor);
        CGContextFillRect(context, self.viewPortHandler.contentRect);
    }
    if (self.drawBordersEnabled) {
        CGContextSetLineWidth(context, self.borderLineWidth);
        CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
        CGContextStrokeRect(context, self.viewPortHandler.contentRect);
    }
    if (self.drawGridBackgroundEnabled || self.drawBordersEnabled) {
        CGContextRestoreGState(context);
    }
}

-(void)autoScale
{
    if (!self.data) {
        return;
    }
    [self.data calcMinMaxY:self.lowestVisibleX to:self.highestVisibleX];
}

-(CGFloat)lowestVisibleX
{
    CGPoint pt = CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentBottom);
    [[self getTransformer:left] pixelToValues:&pt];
    return MAX(self.xAxis.axisMiniMum, pt.x);
}

-(CGFloat)highestVisibleX
{
    CGPoint pt = CGPointMake(self.viewPortHandler.contentRight, self.viewPortHandler.contentBottom);
    [[self getTransformer:left] pixelToValues:&pt];
    return MAX(self.xAxis.axisMaxiMum, pt.x);
}

@end
