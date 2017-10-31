//
//  ViewPortHandler.m
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ViewPortHandler.h"
#import "ChartViewBase.h"

@implementation ViewPortHandler

-(id)init:(CGFloat)width height:(CGFloat)height
{
    if (self = [super init]) {
        self.touchMatrix = CGAffineTransformIdentity;
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

-(void)centerViewPort:(CGPoint)center chart:(ChartViewBase *)chart
{
    CGFloat translateX = center.x - self.offsetLeft;
    CGFloat translateY = center.y - self.offsetTop;
    CGAffineTransform matrix = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-translateX, -translateY), self.touchMatrix);
    [self refresh:self.touchMatrix chart:chart invalidate:YES];
}

-(CGAffineTransform )refresh:(CGAffineTransform)newTransform chart:(ChartViewBase *)chart invalidate:(BOOL)invalidate
{
    self.touchMatrix = newTransform;
    [self limitTransAndScale:self.touchMatrix content:self.contentRect];
    [chart setNeedsDisplay];
    return self.touchMatrix;
}

-(void)limitTransAndScale:(CGAffineTransform)matrix content:(CGRect)content
{
    self.scaleX = MIN(MAX(self.scaleX, matrix.a), self.maxScaleX);
    self.scaleY = MIN(MAX(self.scaleY, matrix.a), self.maxScaleY);
    CGFloat width = content.size.width;
    CGFloat height = content.size.height;
    CGFloat maxTransX = -width*(self.scaleX - 1.0);
    self.transX = MIN(MAX(matrix.ty, maxTransX - self.transOffsetX), self.transOffsetX);
    CGFloat maxTransY = height * (self.scaleY - 1.0);
    self.transY = MAX(MIN(matrix.ty, maxTransY + self.transOffsetY), - self.transOffsetY);
    
    matrix.tx = self.transX;
    matrix.a = self.scaleX;
    matrix.ty = self.transY;
    matrix.d = self.scaleY;
}

-(CGFloat)contentTop
{
    return self.contentRect.origin.y;
}

-(CGFloat)contentLeft
{
    return self.contentRect.origin.x;
}

-(CGFloat)contentBottom
{
    return self.contentRect.origin.y + self.contentRect.size.height;
}

-(CGFloat)contentRight
{
    return self.contentRect.origin.x + self.contentRect.size.width;
}

-(CGFloat)contentWidth
{
    return self.contentRect.size.width;
}

-(BOOL)isFullyZoomedOutY
{
    return !(self.scaleY > self.minScaleY || self.minScaleY > 1.0);
}

@end
