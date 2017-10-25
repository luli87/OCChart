//
//  ChartDataEntryBase.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartDataEntryBase.h"

@implementation ChartDataEntryBase
-(id)initY:(double)y
{
    if (self = [super init]) {
        self.y = y;
    }
    return self;
}
-(id)initY:(double)y data:(id)data
{
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}
-(id)initY:(double)y icon:(UIImage *)icon
{
    if (self = [super init]) {
        self.icon = icon;
    }
    return self;
}
-(id)initY:(double)y icon:(UIImage *)icon data:(id)data
{
    if (self = [super init]) {
        self.y = y;
        self.data = data;
        self.icon = icon;
    }
    return self;
}

@end
