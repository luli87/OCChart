//
//  IHighlighter.h
//  OCChart
//
//  Created by lu li on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Highlight;
@protocol IHighlighter <NSObject>
-(Highlight *)getHighlight:(CGFloat)x y:(CGFloat)y;
@end
