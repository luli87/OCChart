//
//  ChartUtils.m
//  OCChart
//
//  Created by luli on 2017/10/26.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ChartUtils.h"

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
    drawMultilineTextSize(context, text, rect.size, point, attributes, constrainedToSize, anchor, angleRadians);
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
            CGSize rotatedSize = sizeOfRotatedRectangle(size, angleRadians);
            translate.x -= rotatedSize.width * (anchor.x - 0.5);
            translate.y -= rotatedSize.height * (anchor.y - 0.5);
        }
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, translate.x, translate.y);
        CGContextRotateCTM(context, angleRadians);
        [text drawWithRect:rect options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
        CGContextRestoreGState(context);
    } else {
        
    }
    UIGraphicsPopContext();
}

void drawText(CGContextRef context,NSString *text,CGPoint point,NSTextAlignment align,NSDictionary *attributes)
{
    
}

CGSize sizeOfRotatedRectangle(CGSize size,CGFloat radians)
{
    return sizeOfRotatedRectangleWH(size.width, size.height, radians);
}

CGSize sizeOfRotatedRectangleWH(CGFloat rectangleWidth,CGFloat rectangleHeight,CGFloat radians)
{
    CGSize size = CGSizeMake(fabs(rectangleWidth * cos(radians)) + fabs(rectangleHeight * sin(radians)), fabs(rectangleWidth * sin(radians)) + fabs(rectangleHeight * cos(radians)));
    return size;
}
