//
//  AxisRendererBase.h
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <OCChart/OCChart.h>
#import "AxisBase.h"
#import "Transformer.h"
@interface AxisRendererBase : Renderer
@property (strong,nonatomic) AxisBase * axis;
@property (strong,nonatomic) Transformer * transformer;
-(id)init:(ViewPortHandler *)viewPortHandler axis:(AxisBase *)axis transformer:(Transformer *)Transformer;
-(void)computeAxis:(double)min max:(double)max inverted:(BOOL)inverted;
-(void)renderAxisLine:(CGContextRef)context;
@end
