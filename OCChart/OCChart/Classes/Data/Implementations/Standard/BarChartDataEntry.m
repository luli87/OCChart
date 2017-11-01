//
//  BarChartDataEntry.m
//  OCChart
//
//  Created by luli on 2017/11/1.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarChartDataEntry.h"

@implementation BarChartDataEntry

+(double)calcSum:(NSMutableArray<NSNumber *> *)values
{
    if (values.count == 0) {
        return 0;
    }
    double sum = 0;
    for (NSNumber *number in values) {
        sum += [number doubleValue];
    }
    return sum;
}

-(id)init
{
    if (self = [super init]) {
        self.positiveSum = 0;
        self.negativeSum = 0;
    }
    return self;
}

-(NSMutableArray<Range *> *)ranges
{
    if (!_ranges) {
        _ranges = [[NSMutableArray<Range *> alloc] init];
    }
    return _ranges;
}

-(void)setYValues:(NSMutableArray<NSNumber *> *)yValues
{
    _yValues = yValues;
    self.y = [BarChartDataEntry calcSum:self.yValues];
    [self calcPosNegSum];
    [self calcRanges];
}

-(void)calcPosNegSum
{
    if (self.yValues.count == 0) {
        self.positiveSum = 0;
        self.negativeSum = 0;
        return;
    }
    double sumNeg = 0;
    double sumPos = 0;
    for (NSNumber *number in self.yValues) {
        double value = [number doubleValue];
        if (value < 0) {
            sumNeg += -value;
        } else {
            sumPos += value;
        }
    }
    self.negativeSum = sumNeg;
    self.positiveSum = sumPos;
}

-(void)calcRanges
{
    if (self.yValues.count == 0) {
        return;
    }
    double negRemain = -self.negativeSum;
    double posRemain = 0;
    [self.ranges removeAllObjects];
    for (NSNumber *number in self.yValues) {
        double value = [number doubleValue];
        if (value < 0) {
            [self.ranges addObject:[[Range alloc] init:negRemain to:negRemain - value]];
            negRemain -= value;
        } else {
            [self.ranges addObject:[[Range alloc] init:posRemain to:posRemain + value]];
            posRemain += value;
        }
    }
}


@end
