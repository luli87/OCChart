//
//  ChartLimitLine.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ComponentBase.h"

typedef enum : NSUInteger {
    leftTop,
    leftBottom,
    rightTop,
    rightBottom,
} ChartLimitLabelPosition;

@interface ChartLimitLine : ComponentBase
@property(nonatomic,assign)double limit;
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,strong)UIColor * lineColor;
@property (strong,nonatomic) UIFont * valueFont;
@property (strong,nonatomic) UIColor * valueTextColor;
@property(assign,nonatomic)CGFloat lineDashPhase;
@property(assign,nonatomic)BOOL drawLabelEnabled;
@property(assign,nonatomic)NSString *label;
@property(assign,nonatomic)ChartLimitLabelPosition labelPosition;
@property (strong,nonatomic) NSMutableArray<NSNumber *> * lineDashLengths;


@end
