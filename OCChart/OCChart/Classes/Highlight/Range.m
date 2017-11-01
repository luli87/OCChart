//
//  Range.m
//  OCChart
//
//  Created by luli on 2017/11/1.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Range.h"

@implementation Range
-(id)init
{
    if (self = [super init]) {
        self.from = 0;
        self.to = 0;
    }
    return self;
}
-(id)init:(double)from to:(double)to
{
    if (self = [super init]) {
        self.from = from;
        self.to = to;
    }
    return self;
}

@end
