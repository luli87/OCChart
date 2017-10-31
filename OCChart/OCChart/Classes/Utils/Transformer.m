//
//  Transformer.m
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Transformer.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation Transformer

-(id)initViewPortHandler:(ViewPortHandler*)viewPortHandler
{
    if (self = [super init]) {
        self.viewPortHandler = viewPortHandler;
    }
    return self;
}

-(void)prepareMatrixValuePx:(double)chartXMin deltaX:(CGFloat)deltaX deltaY:(CGFloat)deltaY chartYMin:(double)chartYMin
{
    CGFloat scaleX = self.viewPortHandler.contentRect.size.width / deltaX;
    CGFloat scaleY = self.viewPortHandler.contentRect.size.height / deltaY;
    if (isinf(scaleX)) {
        scaleX = 0.0;
    }
    if (isinf(scaleY)) {
        scaleY = 0.0;
    }
    
    self.matrixValueToPx = CGAffineTransformIdentity;
    self.matrixValueToPx = CGAffineTransformScale(self.matrixValueToPx, scaleX, -scaleY);
    self.matrixValueToPx = CGAffineTransformTranslate(self.matrixValueToPx, (-chartXMin), (-chartYMin));
}

-(void)prepareMatrixOffsetInverted:(BOOL)inverted
{
    if (!inverted) {
        self.matrixOffset = CGAffineTransformMakeTranslation(self.viewPortHandler.offsetLeft, self.viewPortHandler.offsetRight);
    } else {
        self.matrixOffset = CGAffineTransformScale(self.matrixValueToPx, 1.0, -1.0);
        self.matrixOffset = CGAffineTransformTranslate(self.matrixOffset, self.viewPortHandler.offsetLeft, self.viewPortHandler.chartHeight - self.viewPortHandler.offsetBottom);
    }
}

-(CGAffineTransform)valueToPixelMatrix
{
    return CGAffineTransformConcat(self.viewPortHandler.touchMatrix, self.matrixValueToPx);
}

-(void )pixelToValues:(CGPoint *)point
{
    CGPoint newPoint = CGPointApplyAffineTransform((*point), CGAffineTransformInvert(self.valueToPixelMatrix));
    point = &newPoint;
}

-(CGAffineTransform)pixelToValueMatrix
{
    return CGAffineTransformInvert(self.valueToPixelMatrix);
}

-(CGPoint)valueForTouchPoint:(CGPoint)point
{
    return CGPointApplyAffineTransform(point, self.pixelToValueMatrix);
}

@end
