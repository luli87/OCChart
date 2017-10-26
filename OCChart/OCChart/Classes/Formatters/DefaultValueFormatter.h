//
//  DefaultValueFormatter.h
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IValueFormatter.h"

@interface DefaultValueFormatter : NSObject<IValueFormatter>
@property(assign,nonatomic)int decimals;
-(id)initDecimals:(int)decimals;
@end
