//
//  ChartUtils.h
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface ChartUtils : NSObject
+(int)decimals:(double)number;
+(double)roundToNextSignificant:(double)number;
+(void)drawMultilineText:(CGContextRef)context text:(NSString *)text point:(CGPoint)point attributes:(NSDictionary *)attributes constrainedToSize:(CGSize)constrainedToSize anchor:(CGPoint)anchor angleRadians:(CGFloat)angleRadians;
+(void)drawMultilineText:(CGContextRef)context text:(NSString *)text knownTextSize:(CGSize)knownTextSize point:(CGPoint)point attributes:(NSDictionary *)attributes constrainedToSize:(CGSize)constrainedToSize anchor:(CGPoint)anchor angleRadians:(CGFloat)angleRadians;
+(CGSize)sizeOfRotatedRectangle:(CGSize)size radians:(CGFloat)radians;
@end
