//
//  Transformer.h
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewPortHandler.h"

@interface Transformer : NSObject
@property(assign,nonatomic)CGAffineTransform matrixValueToPx;
@property(assign,nonatomic)CGAffineTransform matrixOffset;
@property(assign,nonatomic)CGAffineTransform valueToPixelMatrix;
@property (strong,nonatomic) ViewPortHandler * viewPortHandler;
@property(assign,nonatomic)CGAffineTransform pixelToValueMatrix;
-(id)initViewPortHandler:(ViewPortHandler*)viewPortHandler;
-(void)prepareMatrixValuePx:(double)chartXMin deltaX:(CGFloat)deltaX deltaY:(CGFloat)deltaY chartYMin:(double)chartYMin;
-(void)prepareMatrixOffsetInverted:(BOOL)inverted;
-(void )pixelToValues:(CGPoint *)point;
-(CGPoint)valueForTouchPoint:(CGPoint)point;
@end
