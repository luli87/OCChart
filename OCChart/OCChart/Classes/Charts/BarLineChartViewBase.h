//
//  BarLineChartViewBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import "ChartViewBase.h"
#import "BarLineScatterCandleBubbleChartDataProvider.h"
#import "YAxisRenderer.h"
#import "XAxisRenderer.h"
#import "Transformer.h"

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
@property (strong,nonatomic) YAxis * leftAxis;
@property (strong,nonatomic) YAxis * rightAxis;
@property (strong,nonatomic) YAxisRenderer * leftYAxisRenderer;
@property (strong,nonatomic) YAxisRenderer * rightYAxisRenderer;

@property (strong,nonatomic) XAxisRenderer * xAxisRenderer;

@property (strong,nonatomic) Transformer * leftAxisTransformer;
@property (strong,nonatomic) Transformer * rightAxisTransformer;
@property (strong,nonatomic) NSUITapGestureRecognizer * tapGestureRecognizer;
@property(assign,nonatomic)BOOL customViewPortEnabled;

@property(assign,nonatomic)double lowestVisibleX;
@property(assign,nonatomic)double highestVisibleX;

@end
