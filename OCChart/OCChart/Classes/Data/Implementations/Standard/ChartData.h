//
//  ChartData.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IChartDataSet.h"
#import "ChartDataEntry.h"
#import "YAxis.h"
@interface ChartData : NSObject
@property(assign,nonatomic)double yMax;
@property(assign,nonatomic)double yMin;
@property(assign,nonatomic)double xMax;
@property(assign,nonatomic)double xMin;
@property(assign,nonatomic)double leftAxisMax;
@property(assign,nonatomic)double leftAxisMin;
@property(assign,nonatomic)double rightAxisMax;
@property(assign,nonatomic)double rightAxisMin;
@property (strong,nonatomic) NSArray<id<IChartDataSet>> * dataSets;
-(void)notifyDataChanged;
-(void)calcMinMaxY:(double)fromeY to:(double)toY;
-(void)calcMinMax;
-(void)calcMinMax:(ChartDataEntry *)entry axis:(AxisDependency)axis;
-(void)calcMinMax:(id<IChartDataSet>)dataSet;
@end
