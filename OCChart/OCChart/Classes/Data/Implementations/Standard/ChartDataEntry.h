//
//  ChartDataEntry.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartDataEntryBase.h"

@interface ChartDataEntry : ChartDataEntryBase
@property(assign,nonatomic)double x;
-(id)initX:(double)x y:(double)y;
-(id)initX:(double)x y:(double)y data:(id)data;
-(id)initX:(double)x y:(double)y icon:(UIImage *)icon;
-(id)initX:(double)x y:(double)y data:(id)data icon:(UIImage *)icon;
-(id)copyWithZone:(NSZone *)zone;
@end
