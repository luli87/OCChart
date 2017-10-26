//
//  Description.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Description.h"

@implementation Description

-(id)init
{
    if (self = [super init]) {
        self.text = @"描述lalbel";
        self.position = CGPointZero;
        self.textAlign = NSTextAlignmentRight;
        self.font = [UIFont systemFontOfSize:12];
        self.textColor = [UIColor blackColor];
    }
    return self;
}

@end
