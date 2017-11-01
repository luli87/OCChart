//
//  BarChartData.h
//  OCChart
//
//  Created by luli on 2017/10/31.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarLineScatterCandleBubbleChartData.h"

@interface BarChartData : BarLineScatterCandleBubbleChartData
@property(assign,nonatomic)double barWidth;
-(void)groupBars:(double)fromX groupSpace:(double)groupSpace barSpace:(double)barSpace;
-(double)groupWidth:(double)groupSpace barSpace:(double)barSpace;
@end
