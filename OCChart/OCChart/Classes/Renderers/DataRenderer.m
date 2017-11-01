//
//  DataRenderer.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "DataRenderer.h"

@implementation DataRenderer

-(id)init:(Animator *)animator viewPortHandler:(ViewPortHandler *)viewPortHandler
{
    if (self = [super init:viewPortHandler]) {
        self.animator = animator;
    }
    return self;
}

-(void)drawData:(CGContextRef)context
{
    
}

-(void)drawValues:(CGContextRef)context
{
    
}

-(void)drawExtras:(CGContextRef)context
{
    
}

-(void)drawHighlighted:(CGContextRef)context indices:(NSMutableArray<Highlight *>*)indices
{
    
}

@end
