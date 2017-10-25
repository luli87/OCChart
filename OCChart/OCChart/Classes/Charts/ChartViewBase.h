//
//  ChartViewBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XAxis.h"

@interface ChartViewBase : UIView
@property (strong,nonatomic) XAxis * xAxis;
@end
