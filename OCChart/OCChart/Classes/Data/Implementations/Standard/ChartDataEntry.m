//
//  ChartDataEntry.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartDataEntry.h"

@implementation ChartDataEntry
-(id)initX:(double)x y:(double)y
{
    if (self = [super initY:y]) {
        self.x = x;
    }
    return self;
}
-(id)initX:(double)x y:(double)y data:(id)data
{
    if (self = [super initY:y data:data]) {
        self.x = x;
    }
    return self;
}
-(id)initX:(double)x y:(double)y icon:(UIImage *)icon
{
    if (self = [super initY:y icon:icon]) {
        self.x = x;
    }
    return self;
}
-(id)initX:(double)x y:(double)y data:(id)data icon:(UIImage *)icon
{
    if (self = [super initY:y icon:icon data:data]) {
        self.x = x;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone
{
    ChartDataEntry *copy = [ChartDataEntry allocWithZone:zone];
    copy.x = self.x;
    copy.y = self.y;
    copy.data = self.data;
    return copy;
}

@end
