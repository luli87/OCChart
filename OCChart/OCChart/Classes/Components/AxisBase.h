//
//  AxisBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ComponentBase.h"
#import "IAxisValueFormatter.h"
#import "ChartLimitLine.h"

@interface AxisBase : ComponentBase
@property(nonatomic,weak)id<IAxisValueFormatter> axisValueFormatter;
@property(nonatomic,strong)UIFont * lableFont;
@property(nonatomic,strong)UIColor * labelTextColor;
@property(nonatomic,strong)UIColor * axisLineColor;
@property(nonatomic,assign)CGFloat axisLineWidth;
@property(nonatomic,assign)CGFloat axisLineDashPhase;
@property(nonatomic,strong)NSArray<NSNumber *>  *axisLineDashLengths;

@property(nonatomic,strong)UIColor * gridColor;
@property(nonatomic,assign)CGFloat gridLineWidth;
@property(nonatomic,assign)CGFloat gridLineDashPhase;
@property(nonatomic,strong)NSArray<NSNumber *> * gridLineDashLengths;
@property(nonatomic,assign)CGLineCap gridLineCap;

@property(nonatomic,assign)BOOL drawGridLinesEnabled;
@property(nonatomic,assign)BOOL drawAxisLineEnabled;
@property(nonatomic,assign)BOOL drawLabelsEnabled;
@property(nonatomic,assign)BOOL centerAxisLabelsEnabled;
@property(nonatomic,strong)NSMutableArray<ChartLimitLine *> * limitLines;
@property(nonatomic,assign)BOOL drawLimitLinesBehindDataEnabled;
@property(nonatomic,assign)BOOL gridAntialiasEnabled;
@property(nonatomic,strong)NSMutableArray<NSNumber *> * entries;
@property(nonatomic,strong)NSMutableArray<NSNumber *> * centeredEntries;
@property(nonatomic,assign)int entryCount;
@property(nonatomic,assign)int labelCount;
@property(nonatomic,assign)int decimals;
@property(nonatomic,assign)BOOL granularityEnabled;
@property(nonatomic,assign)double granularity;
@property(nonatomic,assign)BOOL forceLabelsEnabled;
@property(nonatomic,strong)id<IAxisValueFormatter> valueFormatter;
@property(nonatomic,assign)double spaceMin;
@property(nonatomic,assign)double spaceMax;
@property(nonatomic,assign)BOOL customAxisMin;
@property(nonatomic,assign)BOOL customAxinMax;
@property(nonatomic,assign)double axisMiniMum;
@property(nonatomic,assign)double axisMaxiMum;
@property(nonatomic,assign)double axisRange;

-(NSString *)getFormattedLabel:(int)index;
-(void)resetCustomAxisMin;
-(void)resetCustomAxisMax;
-(void)calculate:(double)dataMin :(double)dataMax;
@end
