//
//  BarLineScatterCandleBubbleChartDataProvider.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartDataProvider.h"
@class Transformer;
@protocol BarLineScatterCandleBubbleChartDataProvider <ChartDataProvider>
@property(assign,nonatomic)double lowestVisibleX;
@property(assign,nonatomic)double highestVisibleX;
-(Transformer *)getTransformer:(AxisDependency)forAxis;
-(BOOL)isInverted:(AxisDependency)axis;
@end
