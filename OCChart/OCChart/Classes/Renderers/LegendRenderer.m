//
//  LegendRenderer.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "LegendRenderer.h"

@implementation LegendRenderer
-(id)init:(ViewPortHandler *)viewPortHandler legend:(Legend *)legend
{
    if (self = [super init:viewPortHandler]) {
        self.legend = legend;
    }
    return self;
}
@end
