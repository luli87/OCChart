//
//  IAxisValueFormatter.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//
#import <Foundation/Foundation.h>
@class AxisBase;
@protocol IAxisValueFormatter <NSObject>
-(NSString *)stringForValue:(double)value :(AxisBase *)axis;
@end
