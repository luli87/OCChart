//
//  IChartDataSet.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartBaseDataSet.h"
#import "YAxis.h"
#import "IValueFormatter.h"
@class ChartDataEntry;
@protocol IChartDataSet <NSObject>
@property(assign,nonatomic,readonly)double yMin;
@property(assign,nonatomic,readonly)double yMax;
@property(assign,nonatomic,readonly)double xMin;
@property(assign,nonatomic,readonly)double xMax;
@property(assign,nonatomic,readonly)int entryCount;
@property(assign,nonatomic,readonly)BOOL needsFormatter;
@property (weak,nonatomic) id<IValueFormatter> valueFormatter;
@property(assign,nonatomic,readonly)AxisDependency axisDependency;
-(void)notifyDataSetChanged;
-(void)calcMinMax;
-(void)calcMinMaxY:(double)fromY toY:(double)toY;
-(ChartDataEntry *)entryForIndex:(int)index;
-(ChartDataEntry *)entryForXValue:(double)xValue closestToY:(double)closestToY rounding:(ChartDataSetRounding)rounding;
-(ChartDataEntry *)entryForXValue:(double)xValue closestToY:(double)closestToY;
-(ChartDataEntry *)entryForXValue:(double)xValue;
-(int)entryIndex:(double)xValue closestToY:(double)closestToY rounding:(ChartDataSetRounding)rounding;
-(int)entryIndex:(ChartDataEntry *)entry;

@end
