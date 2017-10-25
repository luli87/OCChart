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

@protocol ChartViewDelegate
@end

@interface ChartViewBase : UIView
@property (strong,nonatomic) XAxis * xAxis;
@property (strong,nonatomic) id<IValueFormatter>  defaultValueFormatter;
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

@end
