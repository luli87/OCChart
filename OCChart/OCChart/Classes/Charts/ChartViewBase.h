//
//  ChartViewBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "XAxis.h"
#import "IValueFormatter.h"
#import "ChartData.h"
#import "Description.h"
#import "Legend.h"
#import "LegendRenderer.h"
#import "DataRenderer.h"
#import "IHighlighter.h"
#import "ViewPortHandler.h"
#import "Animator.h"
#import "IMarker.h"
#import "DefaultValueFormatter.h"
#import "ChartUtils.h"

@protocol ChartViewDelegate
@end

@interface ChartViewBase : UIView<AnimatorDelegate>
@property (strong,nonatomic) XAxis * xAxis;
@property (strong,nonatomic) DefaultValueFormatter *defaultValueFormatter;
@property (strong,nonatomic) ChartData * data;
@property(assign,nonatomic)BOOL highlightPerTapEnabled;
@property(assign,nonatomic)BOOL dragDecelerationEnabled;
@property(assign,nonatomic)CGFloat dragDecelerationFrictionCoef;
@property(assign,nonatomic)BOOL drawUnitInChart;
@property (strong,nonatomic) Description * chartDescription;
@property (strong,nonatomic) Legend * legend;
@property(weak,nonatomic)id<ChartViewDelegate> delegate;
@property (strong,nonatomic) NSString * noDataText;
@property (strong,nonatomic) UIFont * noDataFont;
@property (strong,nonatomic) UIColor * noDataTextColor;
@property (strong,nonatomic) LegendRenderer * legendRenderer;
@property (strong,nonatomic) DataRenderer * renderer;
@property(weak,nonatomic)id<IHighlighter> highlighter;
@property(nonatomic,strong)ViewPortHandler * viewPortHandler;
@property(nonatomic,strong)Animator * animator;
@property(assign,nonatomic)BOOL offsetsCalculated;
@property(nonatomic,strong)NSMutableArray<Highlight *> * indicesToHighlight;
@property (strong,nonatomic) Highlight * lastHighlighted;
@property(assign,nonatomic)BOOL drawMarkers;
@property(weak,nonatomic)id<IMarker> marker;
@property(assign,nonatomic)BOOL interceptTouchEvents;
@property(nonatomic,assign)CGFloat extraTopOffset;
@property(nonatomic,assign)CGFloat extraRightOffset;
@property(nonatomic,assign)CGFloat extraBottomOffset;
@property(nonatomic,assign)CGFloat extraLeftOffset;
@property(assign,nonatomic,readonly)BOOL isEmpty;

-(void)initialize;
-(void)setExtraOffsets:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom;
-(void)notifyDataSetChanged;
-(void)clear;
-(void)clearValues;
-(void)calculateOffsets;
-(void)calcMinMax;
-(void)setupDefaultFormatter:(double)min max:(double)max;
@end
