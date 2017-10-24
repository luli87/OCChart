//
//  ComponentBase.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ComponentBase : NSObject
@property(nonatomic,assign)BOOL enabled;
@property(nonatomic,assign)CGFloat xOffset;
@property(nonatomic,assign)CGFloat yOffset;
@end
