//
//  BarChartData.m
//  OCChart
//
//  Created by luli on 2017/10/31.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarChartData.h"
#import "IBarChartDataSet.h"

@implementation BarChartData

-(id)init
{
    if (self = [super init]) {
        self.barWidth = 0.85;
    }
    return self;
}

-(void)groupBars:(double)fromX groupSpace:(double)groupSpace barSpace:(double)barSpace
{
    if (self.dataSets.count <= 1) {
        NSLog(@"BarData needs to hold at least 2 BarDataSets to allow grouping.");
        return;
    }
    int setCount = self.dataSets.count;
    id<IChartDataSet> max = self.maxEntryCountSet;
    int maxEntryCount = max.entryCount;
    double groupSpaceWidthHalf = groupSpace / 2;
    double barSpaceHalf = barSpace/2;
    double barWidthHalf = self.barWidth/2;
    double interval = [self groupWidth:groupSpace barSpace:barSpace];
    for (int i = 0; i<maxEntryCount; i++) {
        double start = fromX;
        fromX += groupSpaceWidthHalf;
        for (id<IChartDataSet> set in self.dataSets) {
            if ([set conformsToProtocol:@protocol(IBarChartDataSet)]) {
                id<IBarChartDataSet> barSet = (id<IBarChartDataSet>)set;
                fromX += barSpaceHalf;
                fromX += barWidthHalf;
                if (i < set.entryCount) {
                    ChartDataEntry *entry = [set entryForIndex:i];
                    entry.x = fromX;
                }
                fromX += barWidthHalf;
                fromX += barSpaceHalf;
            }
        }
        fromX += groupSpaceWidthHalf;
        double end = fromX;
        double innerInterval = end - start;
        double diff = interval - innerInterval;
        if (diff > 0 || diff < 0) {
            fromX += diff;
        }
    }
    [self notifyDataChanged];
}

-(double)groupWidth:(double)groupSpace barSpace:(double)barSpace
{
    return self.dataSets.count*(self.barWidth + barSpace) + groupSpace;
}

@end
