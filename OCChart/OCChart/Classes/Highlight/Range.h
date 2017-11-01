//
//  Range.h
//  OCChart
//
//  Created by luli on 2017/11/1.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Range : NSObject
@property(assign,nonatomic)double from;
@property(assign,nonatomic)double to;
-(id)init:(double)from to:(double)to;
@end
