//
//  ViewPortHandler.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class ChartViewBase;
@interface ViewPortHandler : NSObject
@property(assign,nonatomic,readonly)CGFloat offsetLeft;
@property(assign,nonatomic,readonly)CGFloat offsetTop;
@property(assign,nonatomic,readonly)CGFloat offsetRight;
@property(assign,nonatomic,readonly)CGFloat offsetBottom;
@property(assign,nonatomic)CGRect contentRect;
@property(assign,nonatomic)CGFloat chartWidth;
@property(assign,nonatomic)CGFloat chartHeight;
@property(assign,nonatomic)CGFloat minScaleY;
@property(assign,nonatomic)CGFloat maxScaleY;
@property(assign,nonatomic)CGFloat minScaleX;
@property(assign,nonatomic)CGFloat maxScaleX;
@property(assign,nonatomic)CGFloat scaleX;
@property(assign,nonatomic)CGFloat scaleY;
@property(assign,nonatomic)CGFloat transY;
@property(assign,nonatomic)CGFloat transX;
@property(assign,nonatomic)CGFloat transOffsetX;
@property(assign,nonatomic)CGFloat transOffsetY;
@property(assign,nonatomic)CGAffineTransform touchMatrix;
@property(assign,nonatomic,readonly)CGFloat contentTop;
@property(assign,nonatomic,readonly)CGFloat contentLeft;
@property(assign,nonatomic,readonly)CGFloat contentBottom;
@property(assign,nonatomic,readonly)CGFloat contentRight;
@property(assign,nonatomic,readonly)CGFloat contentWidth;
@property(assign,nonatomic)BOOL isFullyZoomedOutY;

-(id)init:(CGFloat)width height:(CGFloat)height;
-(void)setChartDimens:(CGFloat)width height:(CGFloat)height;
-(void)restrainViewPort:(CGFloat)offsetLeft offsetTop:(CGFloat)offsetTop offsetRight:(CGFloat)offsetRight offsetBottom:(CGFloat)offsetBottom;
-(void)centerViewPort:(CGPoint)center chart:(ChartViewBase *)chart;
-(CGAffineTransform )refresh:(CGAffineTransform)newTransform chart:(ChartViewBase *)chart invalidate:(BOOL)invalidate;
@end
