//
//  BarLineChartViewBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import "ChartViewBase.h"
#import "BarLineScatterCandleBubbleChartDataProvider.h"

@interface BarLineChartViewBase : ChartViewBase<BarLineScatterCandleBubbleChartDataProvider,UIGestureRecognizerDelegate>
@property(nonatomic,assign)int maxVisibleCount;
@property(nonatomic,assign)BOOL autoScaleMinMaxEnabled;
@property(nonatomic,assign)BOOL pinchZoomEnabled;
@property(nonatomic,assign)BOOL doubleTapToZoomEnabled;
@property(nonatomic,assign)BOOL dragEnabled;
@property(nonatomic,assign)BOOL scaleXEnabled;
@property(nonatomic,assign)BOOL scaleYEnabled;
@property(nonatomic,strong)UIColor * gridBackgroundColor;
@property(nonatomic,strong)UIColor * borderColor;
@property(nonatomic,assign)CGFloat borderLineWidth;
@property(nonatomic,assign)BOOL drawGridBackgroundEnabled;
@property(nonatomic,assign)BOOL drawBordersEnabled;
@property(nonatomic,assign)BOOL clipValuesToContentEnabled;
@property(nonatomic,assign)CGFloat minOffset;
@property(nonatomic,assign)BOOL keepPositionOnRotation;


@end
