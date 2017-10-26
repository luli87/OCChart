//
//  ViewPortHandler.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ViewPortHandler.h"

@implementation ViewPortHandler

-(id)init:(CGFloat)width height:(CGFloat)height
{
    if (self = [super init]) {
        [self setChartDimens:width height:height];
    }
    return self;
}

-(void)setChartDimens:(CGFloat)width height:(CGFloat)height
{
    CGFloat offsetLeft = self.offsetLeft;
    CGFloat offsetTop = self.offsetTop;
    CGFloat offsetRight = self.offsetRight;
    CGFloat offsetBottom = self.offsetBottom;
    
    self.chartHeight = height;
    self.chartWidth = width;
    
    [self restrainViewPort:offsetLeft offsetTop:offsetTop offsetRight:offsetRight offsetBottom:offsetBottom];
}

-(void)restrainViewPort:(CGFloat)offsetLeft offsetTop:(CGFloat)offsetTop offsetRight:(CGFloat)offsetRight offsetBottom:(CGFloat)offsetBottom
{
    self.contentRect = CGRectMake(offsetLeft, offsetTop, self.chartWidth - offsetLeft - offsetRight, self.chartHeight - offsetBottom - offsetTop);
}

@end
