//
//  AxisBase.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "AxisBase.h"
#import "DefaultAxisValueFormatter.h"

@implementation AxisBase
@synthesize valueFormatter = _valueFormatter;

-(void)setGranularity:(double)granularity
{
    _granularity = granularity;
    self.granularityEnabled = YES;
}

-(void)setValueFormatter:(id<IAxisValueFormatter>)valueFormatter
{
    if (!valueFormatter) {
        _valueFormatter = [[DefaultAxisValueFormatter alloc] init:self.decimals];
    } else {
        _valueFormatter = valueFormatter;
    }
}

-(id<IAxisValueFormatter>)valueFormatter
{
    if (_axisValueFormatter == nil || ([_axisValueFormatter isMemberOfClass:[DefaultAxisValueFormatter class]] && [(DefaultAxisValueFormatter *)_axisValueFormatter hasAutoDecimals] && [(DefaultAxisValueFormatter *)_axisValueFormatter decimals] != self.decimals)) {
        _axisValueFormatter = [[DefaultAxisValueFormatter alloc] init:self.decimals];
    }
    return _axisValueFormatter;
}

-(void)setAxisMiniMum:(double)axisMiniMum
{
    _axisMiniMum = axisMiniMum;
    self.axisRange = fabs(self.axisMaxiMum - self.axisMiniMum);
}

-(void)setAxisMaxiMum:(double)axisMaxiMum
{
    _axisMaxiMum = axisMaxiMum;
    self.axisRange = fabs(self.axisMaxiMum - self.axisMiniMum);
}

-(NSString *)getFormattedLabel:(int)index
{
    if (index < 0 || index >= self.entries.count) {
        return @"";
    }
    if ([self.valueFormatter respondsToSelector:@selector(stringForValue::)]) {
        return [self.valueFormatter stringForValue:[self.entries[index] doubleValue] :self];
    }
    return @"";
}
-(void)resetCustomAxisMin
{
    self.customAxisMin = NO;
}
-(void)resetCustomAxisMax
{
    self.customAxinMax = NO;
}
-(void)calculate:(double)dataMin :(double)dataMax
{
    double min = self.customAxisMin?self.axisMiniMum:(dataMin - self.spaceMin);
    double max = self.customAxinMax?self.axisMaxiMum:(dataMax + self.spaceMax);
    double range = fabs(max - min);
    if (range == 0.0) {
        max = max + 1.0;
        min = min - 1.0;
    }
    self.axisMiniMum = min;
    self.axisMaxiMum = max;
    self.axisRange = fabs(max - min);
}
@end
