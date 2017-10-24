//
//  DefaultAxisValueFormatter.m
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "DefaultAxisValueFormatter.h"

@implementation DefaultAxisValueFormatter

-(id)init:(int)decimals
{
    if (self = [super init]) {
        self.formatter = [[NSNumberFormatter alloc] init];
        self.formatter.usesGroupingSeparator = YES;
        self.decimals = decimals;
        self.hasAutoDecimals = YES;
    }
    return self;
}
@end
