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
} LabelPosition;

@interface ChartLimitLine : ComponentBase
@property(nonatomic,assign)double limit;
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,strong)UIColor * lineColor;


@end
