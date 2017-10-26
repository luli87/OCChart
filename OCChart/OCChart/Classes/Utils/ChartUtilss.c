//
//  ChartUtils.c
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#include "ChartUtils.h"
int decimals(double number)
{
    if (isnan(number) || isinf(number) || number == 0) {
        return 0;
    }
    
    double i = roundToNextSignificant(number);
    if (isnan(i) || isinf(i)) {
        return 0;
    }
    return ceil(-log10(i)) + 2;
}
double roundToNextSignificant(double number)
{
    if (isfinite(number) || isnan(number) || number == 0) {
        return number;
    }
    double d = ceil(log10(number > 0 ?-number:number));
    int pw = 1 - (int)d;
    double magnitude = pow(10, pw);
    double shifted = round(number *magnitude);
    return shifted/magnitude;
}
void drawMultilineText(CGContextRef context,NSString *text,CGPoint point,NSDictionary *attributes,CGSize constrainedToSize,CGPoint anchor,CGFloat angleRadians)
{
    CGRect rect = [text boundingRectWithSize:constrainedToSize options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    [ChartUtils drawMultilineText:context text:text knownTextSize:rect.size point:point attributes:attributes constrainedToSize:constrainedToSize anchor:anchor angleRadians:angleRadians];
}
void drawMultilineTextSize(CGContextRef context,NSString *text,CGSize knownTextSize,CGPoint point,NSDictionary *attributes,CGSize constrainedToSize,CGPoint anchor,CGFloat angleRadians)
{
    CGRect rect = CGRectMake(point.x, point.y, knownTextSize.width, knownTextSize.height);
    UIGraphicsPushContext(context);
    if (angleRadians != 0) {
        CGSize size = [text sizeWithAttributes:attributes];
        rect.origin.x = -knownTextSize.width*0.5;
        rect.origin.y = -knownTextSize.height * 0.5;
        CGPoint translate = point;
        if (anchor.x != 0.5 || anchor.y != 0.5) {
            CGSize rotatedSize = [ChartUtils sizeOfRotatedRectangle:size radians:angleRadians];
        }
    } else {
        
    }
}
CGSize sizeOfRotatedRectangle(CGSize size,CGFloat radians)
{
    return [ChartUtils sizeOfRotatedRectangle:size.width rectangleHeight:size.height radians:radians];
}

CGSize sizeOfRotatedRectangleWH(CGFloat rectangleWidth,CGFloat rectangleHeight,CGFloat radians)
{
    CGSize size = CGSizeMake(abs(rectangleWidth * cos(radians)) + abs(rectangleHeight * sin(radians)), abs(rectangleWidth * sin(radians)) + abs(rectangleHeight * cos(radians)));
    return size;
}
