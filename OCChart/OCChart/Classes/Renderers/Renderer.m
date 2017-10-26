//
//  Renderer.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Renderer.h"

@implementation Renderer
-(id)init:(ViewPortHandler *)viewPortHandler
{
    if (self = [super init]) {
        self.viewPortHandler = viewPortHandler;
    }
    return self;
}
@end
