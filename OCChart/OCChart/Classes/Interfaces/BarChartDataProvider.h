//
//  BarChartDataProvider.h
//  OCChart
//
//  Created by luli on 2017/10/31.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import "BarChartData.h"
#import "BarLineScatterCandleBubbleChartDataProvider.h"

@protocol BarChartDataProvider <BarLineScatterCandleBubbleChartDataProvider>
@property (strong,nonatomic,readonly) BarChartData * barData;
@property(assign,nonatomic,readonly)BOOL isDrawBarShadowEnabled;
@property(assign,nonatomic,readonly)BOOL isDrawValueAboveBarEnabled;
@property(assign,nonatomic,readonly)BOOL isHighlightFullBarEnabled;

@end
