//
//  BarChartRenderer.h
//  OCChart
//
//  Created by luli on 2017/10/31.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "BarLineScatterCandleBubbleRenderer.h"
#import "BarChartDataProvider.h"

@interface Buffer : NSObject 
@end

@interface BarChartRenderer : BarLineScatterCandleBubbleRenderer
@property(weak,nonatomic)id<BarChartDataProvider> dataProvider;
@property (strong,nonatomic) NSMutableArray<Buffer *> * buffers;
@end
