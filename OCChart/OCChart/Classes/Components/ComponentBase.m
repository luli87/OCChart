//
//  ComponentBase.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ComponentBase.h"

@implementation ComponentBase
-(id)init
{
    if (self = [super init]) {
        self.enabled = YES;
        self.xOffset = 0.5;
        self.yOffset = 0.5;
    }
    return self;
}
@end
