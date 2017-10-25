//
//  YAxis.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "AxisBase.h"

typedef enum : NSUInteger {
    outsideChart,
    insideChart,
} YAxisLabelPosition;

typedef enum : NSUInteger {
    left,
    right,
} AxisDependency;

@interface YAxis : AxisBase
@property(assign,nonatomic)BOOL drawBottomYLabelEntryEnabled;
@property(assign,nonatomic)BOOL drawTopYLabelEntryEnabled;
@property(assign,nonatomic)BOOL inverted;
@property(assign,nonatomic)BOOL drawZeroLineEnabled;
@property (strong,nonatomic) UIColor * zeroLineColor;
@property(assign,nonatomic)CGFloat zeroLineWidth;
@property(assign,nonatomic)CGFloat zeroLineDashPhase;
@property (strong,nonatomic) NSArray<NSNumber *> * zeroLineDashLengths;
@property(assign,nonatomic)CGFloat spaceTop;
@property(assign,nonatomic)CGFloat spaceBottom;
@property(assign,nonatomic)YAxisLabelPosition labelPosition;
@property(assign,nonatomic)AxisDependency axisDependency;
@property(assign,nonatomic)CGFloat minWidth;
@property(assign,nonatomic)CGFloat maxWidth;
@property(assign,nonatomic,readonly)CGSize requiredSize;
-(id)initPosition:(AxisDependency)position;
@end
