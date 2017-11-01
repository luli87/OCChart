//
//  YAxisRenderer.m
//  OCChart
//
//  Created by luli on 2017/10/30.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "YAxisRenderer.h"

@implementation YAxisRenderer

-(id)init:(ViewPortHandler *)viewPortHandler yAxis:(YAxis *)yAxis transformer:(Transformer *)Transformer
{
    if (self = [super init:viewPortHandler axis:yAxis transformer:Transformer]) {
        
    }
    return self;
}

-(void)renderAxisLine:(CGContextRef)context
{
    if (![self.axis isMemberOfClass: [YAxis class]] || !self.viewPortHandler) {
        return;
    }
    YAxis *yAxis = (YAxis *)self.axis;
    if (!yAxis.enabled || !yAxis.drawAxisLineEnabled) {
        return;
    }
    CGContextSaveGState(context);
    CGContextSetStrokeColorWithColor(context, yAxis.axisLineColor.CGColor);
    CGContextSetLineWidth(context, yAxis.axisLineWidth);
    if (yAxis.axisLineDashLengths.count) {
        CGFloat dashs[yAxis.axisLineDashLengths.count];
        for (int i = 0; i < yAxis.axisLineDashLengths.count; i++) {
            CGFloat value = [yAxis.axisLineDashLengths[i] floatValue];
            dashs[i] = value;
        }
        CGContextSetLineDash(context, yAxis.axisLineDashPhase, dashs, yAxis.axisLineDashLengths.count);
    } else {
        CGFloat dashs[0];
        CGContextSetLineDash(context, 0, dashs, 0);
    }
    if (yAxis.axisDependency == left) {
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, self.viewPortHandler.contentLeft, self.viewPortHandler.contentTop);
        CGContextAddLineToPoint(context, self.viewPortHandler.contentRight, self.viewPortHandler.contentTop);
        CGContextStrokePath(context);
    } else {
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, self.viewPortHandler.contentLeft, self.viewPortHandler.contentBottom);
        CGContextAddLineToPoint(context, self.viewPortHandler.contentRight, self.viewPortHandler.contentBottom);
        CGContextStrokePath(context);
    }
    CGContextRestoreGState(context);
}

-(void)renderLimitLines:(CGContextRef)context
{
    if (![self.axis isMemberOfClass: [YAxis class]] || !self.viewPortHandler || !self.transformer) {
        return;
    }
    YAxis *yAxis = (YAxis *)self.axis;
    NSMutableArray *limitLines = yAxis.limitLines;
    if (limitLines.count == 0) {
        return;
    }
    CGContextSaveGState(context);
    CGAffineTransform trans = self.transformer.valueToPixelMatrix;
    CGPoint position = CGPointMake(0, 0);
    for (int i = 0; i < limitLines.count; i++) {
        ChartLimitLine *l = limitLines[i];
        if (l.enabled) {
            continue;
        }
        CGContextSaveGState(context);
        CGRect clippingRect = self.viewPortHandler.contentRect;
        clippingRect.origin.y -= l.lineWidth / 2.0;
        clippingRect.size.height += l.lineWidth;
        CGContextClipToRect(context, clippingRect);
        position.x = 0.0;
        position.y = l.limit;
        position = CGPointApplyAffineTransform(position, trans);
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, self.viewPortHandler.contentLeft, position.y);
        CGContextAddLineToPoint(context, self.viewPortHandler.contentRight, position.y);
        CGContextSetStrokeColorWithColor(context, l.lineColor.CGColor);
        CGContextSetLineWidth(context, l.lineWidth);
        if (l.lineDashLengths) {
            CGFloat dashs[l.lineDashLengths.count];
            for (int i = 0; i < l.lineDashLengths.count; i++) {
                dashs[i] = [l.lineDashLengths[i] floatValue];
                CGContextSetLineDash(context, l.lineDashPhase, dashs, l.lineDashLengths.count);
            }
        } else {
            CGFloat dashs[0];
            CGContextSetLineDash(context, 0, dashs, 0);
        }
        CGContextStrokePath(context);
        NSString *label = l.label;
        if (l.drawLabelEnabled && l.label.length > 0) {
            CGFloat labelLineHeight = l.valueFont.lineHeight;
            CGFloat xOffset = 4.0 + l.xOffset;
            CGFloat yOffset = l.lineWidth + labelLineHeight + l.yOffset;
            if (l.labelPosition == rightTop) {
                drawText(context, label, CGPointMake(self.viewPortHandler.contentRight - xOffset, position.y - yOffset), NSTextAlignmentRight, @{NSFontAttributeName:l.valueFont,NSForegroundColorAttributeName:l.valueTextColor});
            } else if (l.labelPosition == rightBottom) {
                drawText(context, label, CGPointMake(self.viewPortHandler.contentRight - xOffset, position.y + yOffset - labelLineHeight), NSTextAlignmentRight, @{NSFontAttributeName:l.valueFont,NSForegroundColorAttributeName:l.valueTextColor});
            } else if (l.labelPosition == leftTop) {
                drawText(context, label, CGPointMake(self.viewPortHandler.contentLeft + xOffset, position.y - yOffset), NSTextAlignmentLeft, @{NSFontAttributeName:l.valueFont,NSForegroundColorAttributeName:l.valueTextColor});
            } else {
                drawText(context, label, CGPointMake(self.viewPortHandler.contentLeft + xOffset, position.y + yOffset - labelLineHeight), NSTextAlignmentRight, @{NSFontAttributeName:l.valueFont,NSForegroundColorAttributeName:l.valueTextColor});
            }
        }
    }
    CGContextRestoreGState(context);
}

@end
