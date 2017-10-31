//
//  ChartUtils.h
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#ifndef ChartUtils_h
#define ChartUtils_h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

int decimals(double number);
double roundToNextSignificant(double number);
void drawMultilineText(CGContextRef context,NSString *text,CGPoint point,NSDictionary *attributes,CGSize constrainedToSize,CGPoint anchor,CGFloat angleRadians);
void drawMultilineTextSize(CGContextRef context,NSString *text,CGSize knownTextSize,CGPoint point,NSDictionary *attributes,CGSize constrainedToSize,CGPoint anchor,CGFloat angleRadians);
void drawText(CGContextRef context,NSString *text,CGPoint point,NSTextAlignment align,NSDictionary *attributes);
CGSize sizeOfRotatedRectangle(CGSize size,CGFloat radians);
CGSize sizeOfRotatedRectangleWH(CGFloat rectangleWidth,CGFloat rectangleHeight,CGFloat radians);
double nextUp(double number);
#endif /* ChartUtils_h */
