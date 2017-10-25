//
//  ChartDataEntryBase.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChartDataEntryBase : NSObject
@property(assign,nonatomic)double y;
@property (strong,nonatomic) id data;
@property (strong,nonatomic) UIImage * icon;
-(id)initY:(double)y;
-(id)initY:(double)y data:(id)data;
-(id)initY:(double)y icon:(UIImage *)icon;
-(id)initY:(double)y icon:(UIImage *)icon data:(id)data;
@end
