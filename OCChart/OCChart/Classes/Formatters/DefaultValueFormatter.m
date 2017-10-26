//
//  DefaultValueFormatter.m
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "DefaultValueFormatter.h"
@implementation DefaultValueFormatter
-(id)initDecimals:(int)decimals
{
    if (self = [super init]) {
        self.decimals = decimals;
    }
    return self;
}
@end
