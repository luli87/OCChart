//
//  DataRenderer.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Renderer.h"
#import "Animator.h"
#import "Highlight.h"
@interface DataRenderer : Renderer
@property (strong,nonatomic) Animator * animator;
-(id)init:(Animator *)animator viewPortHandler:(ViewPortHandler *)viewPortHandler;
-(void)drawData:(CGContextRef)context;
-(void)drawValues:(CGContextRef)context;
-(void)drawExtras:(CGContextRef)context;
-(void)drawHighlighted:(CGContextRef)context indices:(NSMutableArray<Highlight *>*)indices;
@end
