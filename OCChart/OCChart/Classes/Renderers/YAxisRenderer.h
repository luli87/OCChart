//
//  YAxisRenderer.h
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "AxisRendererBase.h"
@interface YAxisRenderer : AxisRendererBase

-(id)init:(ViewPortHandler *)viewPortHandler yAxis:(YAxis *)yAxis transformer:(Transformer *)Transformer;

@end
