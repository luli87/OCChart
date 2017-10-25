//
//  ChartData.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartData.h"

@implementation ChartData
@synthesize dataSets = _dataSets;
-(id)init
{
    if (self = [super init]) {
        self.yMax = DBL_MAX;
        self.yMin = DBL_MIN;
        self.xMax = DBL_MAX;
        self.xMin = DBL_MIN;
        self.leftAxisMax = DBL_MAX;
        self.leftAxisMin = DBL_MIN;
        self.rightAxisMax = DBL_MAX;
        self.rightAxisMin = DBL_MIN;
        
    }
    return self;
}

-(NSArray <id<IChartDataSet>> *)dataSets
{
    if (!_dataSets) {
        _dataSets = [[NSArray alloc] init];
    }
    return _dataSets;
}

-(void)setDataSets:(NSArray<id<IChartDataSet>> *)dataSets
{
    _dataSets = dataSets;
    [self notifyDataChanged];
}

-(void)notifyDataChanged
{
    [self calcMinMax];
}

-(void)calcMinMaxY:(double)fromeY to:(double)toY
{
    for (id<IChartDataSet> set in self.dataSets) {
        [set calcMinMaxY:fromeY toY:toY];
    }
    [self calcMinMax];
}
-(id<IChartDataSet>)getFirstLeft:(NSArray<id<IChartDataSet>> *)dataSets
{
    for (id<IChartDataSet> set in dataSets) {
        if (set.axisDependency == left) {
            return set;
        }
    }
    return nil;
}

-(id<IChartDataSet>)getFirstRight:(NSArray<id<IChartDataSet>> *)dataSets
{
    for (id<IChartDataSet> set in dataSets) {
        if (set.axisDependency == right) {
            return set;
        }
    }
    return nil;
}

-(void)calcMinMax
{
    self.yMax = DBL_MAX;
    self.yMin = DBL_MIN;
    self.xMax = DBL_MAX;
    self.xMin = DBL_MIN;
    
    for (id<IChartDataSet> set in self.dataSets) {
        [set calcMinMax];
    }
    
    self.leftAxisMax = DBL_MAX;
    self.leftAxisMin = DBL_MIN;
    self.rightAxisMax = DBL_MAX;
    self.rightAxisMin = DBL_MIN;
    
    // left axis
    id<IChartDataSet> firstLeft = [self getFirstLeft:self.dataSets];
    if (firstLeft) {
        self.leftAxisMax = firstLeft.yMax;
        self.leftAxisMin = firstLeft.yMin;
        for (id<IChartDataSet> dataSet in self.dataSets) {
            if (dataSet.axisDependency == left) {
                if (dataSet.yMin < self.leftAxisMin) {
                    self.leftAxisMin = dataSet.yMin;
                }
                if (dataSet.yMax > self.leftAxisMax) {
                    self.leftAxisMax = dataSet.yMax;
                }
            }
        }
    }
    
    // right axis
    id<IChartDataSet> firstRight = [self getFirstRight:self.dataSets];
    if (firstRight) {
        self.rightAxisMax = firstRight.yMax;
        self.rightAxisMin = firstRight.yMin;
        for (id<IChartDataSet> dataSet in self.dataSets) {
            if (dataSet.axisDependency == right) {
                if (dataSet.yMin < self.rightAxisMin) {
                    self.rightAxisMin = dataSet.yMin;
                }
                if (dataSet.yMax > self.rightAxisMax) {
                    self.rightAxisMin = dataSet.yMax;
                }
            }
        }
    }
}

-(void)calcMinMax:(ChartDataEntry *)entry axis:(AxisDependency)axis
{
    if (self.yMax < entry.y) {
        self.yMax = entry.y;
    }
    if (self.yMin > entry.y) {
        self.yMin = entry.y;
    }
    if (self.xMax < entry.x) {
        self.xMax = entry.x;
    }
    if (self.xMin > entry.x) {
        self.xMin = entry.x;
    }
    if (axis == left) {
        if (self.leftAxisMax < entry.y) {
            self.leftAxisMax = entry.y;
        }
        if (self.leftAxisMin > entry.y) {
            self.leftAxisMin = entry.y;
        }
    } else {
        if (self.rightAxisMax < entry.y) {
            self.rightAxisMax = entry.y;
        }
        if (self.rightAxisMin > entry.y) {
            self.rightAxisMin = entry.y;
        }
    }
}

-(void)calcMinMax:(id<IChartDataSet>)dataSet
{
    if (self.yMax < dataSet.yMax) {
        self.yMax = dataSet.yMax;
    }
    if (self.yMin > dataSet.yMin) {
        self.yMin = dataSet.yMin;
    }
    if (self.xMax < dataSet.xMax) {
        self.xMax = dataSet.xMax;
    }
    if (self.xMin > dataSet.xMin) {
        self.xMin = dataSet.xMin;
    }
    if (dataSet.axisDependency == left) {
        if (self.leftAxisMax < dataSet.yMax) {
            self.leftAxisMax = dataSet.yMax;
        }
        if (self.leftAxisMin > dataSet.yMin) {
            self.leftAxisMin = dataSet.yMin;
        }
    } else {
        if (self.rightAxisMax < dataSet.yMax ) {
            self.rightAxisMax = dataSet.yMax;
        }
        if (self.rightAxisMin > dataSet.yMin) {
            self.rightAxisMin = dataSet.yMin;
        }
    }
}

@end
