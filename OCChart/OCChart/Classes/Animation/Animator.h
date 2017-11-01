//
//  Animator.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Animator;
@protocol AnimatorDelegate
-(void)animatorUpdated:(Animator *)animator;
-(void)animatorStopped:(Animator *)animator;
@end

@interface Animator : NSObject
@property(weak,nonatomic)id<AnimatorDelegate> delegate;
@property(assign,nonatomic)double phaseX;
@property(assign,nonatomic)double phaseY;
@property (strong,nonatomic) void(^updateBlock)(void);
@property (strong,nonatomic) void(^stopBlock)(void);
@end
