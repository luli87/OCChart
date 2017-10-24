//
//  DefaultAxisValueFormatter.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAxisValueFormatter.h"
@class AxisBase;
typedef NSString *(^Block)(double value,AxisBase *axis);

@interface DefaultAxisValueFormatter : NSObject<IAxisValueFormatter>
@property(nonatomic,strong)Block block;
@property(nonatomic,assign)BOOL hasAutoDecimals;
@property(nonatomic,strong)NSNumberFormatter * formatter;
@property(nonatomic,assign)int decimals;
-(id)init:(int)decimals;
@end
