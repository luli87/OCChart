//
//  BarChartDataEntry.h
//  OCChart
//
//  Created by luli on 2017/11/1.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartDataEntry.h"
#import "Range.h"

@interface BarChartDataEntry : ChartDataEntry
@property(assign,nonatomic)NSMutableArray<NSNumber *> *yValues;
@property(assign,nonatomic)double negativeSum;
@property(assign,nonatomic)double positiveSum;
@property (strong,nonatomic) NSMutableArray<Range *> * ranges;
@end
