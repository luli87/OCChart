//
//  IValueFormatter.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartDataEntry.h"
#import "ViewPortHandler.h"

@protocol IValueFormatter <NSObject>
-(NSString *)stringForValue:(double)value :(ChartDataEntry *)entry index:(int)dataSetIndex viewPortHandler:(ViewPortHandler *)viewPortHandler;
@end
