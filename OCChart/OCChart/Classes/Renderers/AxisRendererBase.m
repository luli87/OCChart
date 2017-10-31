//
//  AxisRendererBase.m
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "AxisRendererBase.h"

@implementation AxisRendererBase
-(id)init:(ViewPortHandler *)viewPortHandler axis:(AxisBase *)axis transformer:(Transformer *)transformer
{
    if (self = [super init:viewPortHandler]) {
        self.transformer = transformer;
        self.axis = axis;
    }
    return self;
}

-(void)renderAxisLine:(CGContextRef)context
{
    
}

-(void)computeAxis:(double)min max:(double)max inverted:(BOOL)inverted
{
    if (self.transformer && self.viewPortHandler) {
        if (self.viewPortHandler.contentWidth > 10 && self.viewPortHandler.isFullyZoomedOutY) {
            CGPoint p1 = [self.transformer valueForTouchPoint:CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentTop)];
            CGPoint p2 = [self.transformer valueForTouchPoint:CGPointMake(self.viewPortHandler.contentLeft, self.viewPortHandler.contentBottom)];
            if (inverted) {
                min = p2.y;
                max = p1.y;
            } else {
                min = p1.y;
                max = p2.y;
            }
        }
        [self computeAxisValues:min max:max];
    }
}

-(void)computeAxisValues:(double)min max:(double)max
{
    if (!self.axis) {
        return;
    }
    double yMin = min;
    double yMax = max;
    int labelCount = self.axis.labelCount;
    double range = fabs(yMax = yMin);
    if (labelCount == 0 ||range <= 0 ||isfinite(range)) {
        self.axis.entries = [[NSMutableArray alloc] init];
        self.axis.centeredEntries = [[NSMutableArray alloc] init];
        return;
    }
    
    double rawInterval = range/(double)labelCount;
    double interval = roundToNextSignificant(rawInterval);
    
    if (self.axis.granularityEnabled) {
        interval = interval < self.axis.granularity?self.axis.granularity :interval;
    }
    double intervalMagnitude = roundToNextSignificant(pow(10, (double)((int)log10(interval))));
    int intervalSigDigit = interval/intervalMagnitude;
    if (intervalSigDigit > 5) {
        interval = floor(10 * intervalMagnitude);
    }
    int n = self.axis.centerAxisLabelsEnabled?1:0;
    if (self.axis.forceLabelsEnabled) {
        interval = range/(double)(labelCount - 1);
        [self.axis.entries removeAllObjects];
        self.axis.entries = [[NSMutableArray alloc] initWithCapacity:labelCount];
        double v = yMin;
        for (int i = 0; i < labelCount; i++) {
            [self.axis.entries addObject: [NSNumber numberWithDouble:v]];
            v += interval;
        }
        n = labelCount;
    } else {
        double first = interval == 0?0:ceil(yMin/interval)*interval;
        if (self.axis.centerAxisLabelsEnabled) {
            first -= interval;
        }
        double last = interval == 0?0:nextUp(floor(yMax/interval)*interval);
        if (interval != 0 && last != first) {
            for (double i = first; i < last; i+=interval) {
                n+=1;
            }
        }
        [self.axis.entries removeAllObjects];
        self.axis.entries = [[NSMutableArray alloc] initWithCapacity:labelCount];
        double f = first;
        int i = 0;
        while (i<n) {
            if (f == 0) {
                f = 0;
            }
            [self.axis.entries addObject:[NSNumber numberWithDouble:f]];
            f+=interval;
            i+=1;
        }
    }
    if (interval < 1) {
        self.axis.decimals = ceil(-log10(interval));
    } else {
        self.axis.decimals = 0;
    }
    if (self.axis.centerAxisLabelsEnabled) {
        self.axis.centeredEntries = [[NSMutableArray alloc] initWithCapacity:n];
        double offset = interval/2.0;
        for (int j = 0; j < n; j++) {
            [self.axis.centeredEntries addObject: [NSNumber numberWithDouble:[self.axis.entries[j] doubleValue] + offset]];
        }
    }
}
@end
