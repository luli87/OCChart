//
//  ChartViewBase.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartViewBase.h"

@implementation ChartViewBase

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    self.backgroundColor = [UIColor clearColor];
    self.animator = [[Animator alloc] init];
    self.animator.delegate = self;
    
    self.viewPortHandler = [[ViewPortHandler alloc] init];
    [self.viewPortHandler setChartDimens:self.bounds.size.width height:self.bounds.size.height];
    self.chartDescription = [[Description alloc] init];
    
    self.legend = [[Legend alloc] init];
    self.legendRenderer = [[LegendRenderer alloc] init:self.viewPortHandler legend:self.legend];
    self.xAxis = [[XAxis alloc] init];
    self.defaultValueFormatter = [[DefaultValueFormatter alloc] initDecimals:0];
    self.noDataText = @"no data";
    self.noDataFont = [UIFont systemFontOfSize:14];
    self.noDataTextColor = [UIColor blackColor];
    [self addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)setExtraOffsets:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom
{
    self.extraLeftOffset = left;
    self.extraTopOffset = top;
    self.extraRightOffset = right;
    self.extraBottomOffset = bottom;
}

-(void)setData:(ChartData *)data
{
    _data = data;
    self.offsetsCalculated = NO;
    if (!self.data) {
        return;
    }
    [self setupDefaultFormatter:self.data.yMin max:self.data.yMax];
    for (id<IChartDataSet> set in self.data.dataSets) {
        if (set.needsFormatter || set.valueFormatter != self.defaultValueFormatter) {
            set.valueFormatter = self.defaultValueFormatter;
        }
    }
    [self notifyDataSetChanged];
}

-(void)clear
{
    self.data = nil;
    self.offsetsCalculated = NO;
    [self.indicesToHighlight removeAllObjects];
    self.lastHighlighted = nil;
    [self setNeedsDisplay];
}

-(void)clearValues
{
    [self.data clearValues];
    [self setNeedsDisplay];
}

-(BOOL)isEmpty
{
    if (self.data.entryCount == 0) {
        return YES;
    }
    return NO;
}

-(void)setupDefaultFormatter:(double)min max:(double)max
{
    double reference = 0;
    if (self.data.entryCount >= 2) {
        reference = fabs(max - min);
    } else {
        double absMin = fabs(min);
        double absMax = fabs(max);
        reference = absMin > absMax ? absMin : absMax;
    }
    if ([self.defaultValueFormatter isMemberOfClass:[DefaultValueFormatter class]]) {
        self.defaultValueFormatter.decimals = decimals(reference);
    }
}

-(void)notifyDataSetChanged
{
    
}

-(void)calculateOffsets
{
    
}

-(void)calcMinMax
{
    
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        return;
    }
    
    CGRect frame = self.bounds;
    
    if (self.data && self.noDataText.length > 0) {
        
    }
    if (!self.offsetsCalculated) {
        [self calculateOffsets];
        self.offsetsCalculated = YES;
        CGContextSaveGState(context);
        drawMultilineText(context, self.noDataText, CGPointMake(frame.size.width/2, frame.size.height/2), @{NSFontAttributeName:self.noDataFont,NSForegroundColorAttributeName:self.noDataTextColor}, self.bounds.size, CGPointMake(0.5, 0.5), 0);
        CGContextRestoreGState(context);
        return;
    }
    if (!self.offsetsCalculated) {
        [self calculateOffsets];
        self.offsetsCalculated = YES;
    }
}

-(void)drawDescription:(CGContextRef)context
{
    if (self.chartDescription.enabled && self.chartDescription.text.length > 0) {
        CGPoint position = self.chartDescription.position;
        if (CGPointEqualToPoint(CGPointZero, position)) {
            position = CGPointMake(self.bounds.size.width - self.viewPortHandler.offsetRight - self.chartDescription.xOffset, self.bounds.size.height - self.viewPortHandler.offsetBottom - self.chartDescription.yOffset - self.chartDescription.font.lineHeight);
        }
        
    }
}

@end
