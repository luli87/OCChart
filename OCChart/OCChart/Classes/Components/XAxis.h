//
//  XAxis.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "AxisBase.h"

typedef enum : NSUInteger {
    top,
    bottom,
    bothSided,
    topInside,
    bottomInside,
} XAxisLabelPosition;

@interface XAxis : AxisBase
@property(assign,nonatomic)CGFloat labelWidth;
@property(assign,nonatomic)CGFloat labelHeight;
@property(assign,nonatomic)CGFloat labelRotatedWidth;
@property(assign,nonatomic)CGFloat labelRotatedHeight;
@property(assign,nonatomic)CGFloat labelRotationAngle;
@property(assign,nonatomic)BOOL avoidFirstLastClippingEnabled;
@property(assign,nonatomic)XAxisLabelPosition labelPosition;
@property(assign,nonatomic)BOOL wordWrapEnabled;
@property(assign,nonatomic)CGFloat wordWrapWidthPercent;

@end
