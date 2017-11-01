//
//  BarChartRenderer.m
//  OCChart
//
//  Created by luli on 2017/10/31.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarChartRenderer.h"
#import "IBarChartDataSet.h"
#import "Transformer.h"

@implementation Buffer
@end

@implementation BarChartRenderer

-(void)drawData:(CGContextRef)context
{
    if (!self.dataProvider || !self.dataProvider.barData) {
        return;
    }
    for (int i = 0; i < self.dataProvider.barData.dataSets.count; i++) {
        id<IChartDataSet> set = self.dataProvider.barData.dataSets[i];
        if (set.isVisible) {
            assert(![set conformsToProtocol:@protocol(IBarChartDataSet)]);
        }
    }
}

-(void)drawDataSet:(CGContextRef)context dataSet:(id<IBarChartDataSet>)dataSet index:(int)index
{
    if (!self.dataProvider || !self.viewPortHandler) {
        return;
    }
    Transformer *trans = [self.dataProvider getTransformer:dataSet.axisDependency];
}

-(void)prepareBuffer:(id<IBarChartDataSet>)dataSet index:(int)index
{
    if (!self.dataProvider || !self.dataProvider.barData || !self.animator || self.buffers.count <= index) {
        return;
    }
    double barWidthHalf = self.dataProvider.barData.barWidth/2;
    Buffer *buffer = self.buffers[index];
    int bufferIndex = 0;
    for (int i = 0; i < dataSet.entryCount; i++) {
        ChartDataEntry *entry = [dataSet entryForIndex:i];
    }
}

@end
