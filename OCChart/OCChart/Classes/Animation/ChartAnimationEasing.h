//
//  ChartAnimationEasing.h
//  OCChart
//
//  Created by lu li on 2017/10/24.
//  Copyright © 2017年 lu li. All rights reserved.
//

#ifndef ChartAnimationEasing_h
#define ChartAnimationEasing_h

typedef enum : NSUInteger {
    linear,
    easeInQuad,
    easeOutQuad,
    easeInOutQuad,
    easeInCubic,
    easeOutCubic,
    easeInOutCubic,
    easeInQuart,
    easeOutQuart,
    easeInOutQuart,
    easeInQuint,
    easeOutQuint,
    easeInOutQuint,
    easeInSine,
    easeOutSine,
    easeInOutSine,
    easeInExpo,
    easeOutExpo,
    easeInOutExpo,
    easeInCirc,
    easeOutCirc,
    easeInOutCirc,
    easeInElastic,
    easeOutElastic,
    easeInOutElastic,
    easeInBack,
    easeOutBack,
    easeInOutBack,
    easeInBounce,
    easeOutBounce,
    easeInOutBounce,
} ChartEasingOption;

typedef double(^ChartEasingFunctionBlock)(NSTimeInterval elapsed,NSTimeInterval duration);

ChartEasingFunctionBlock easingFunctionFromOption(ChartEasingOption option)
{
    switch (option) {
        case linear:
            return ^double(NSTimeInterval elapsed,NSTimeInterval duration){
                return elapsed/duration;
            };
            break;
        case easeInQuad:
        {
            return ^double(NSTimeInterval elapsed,NSTimeInterval duration){
                double position = elapsed/duration;
                return position*position;
            };
        }
            break;
        case easeOutQuad:
        {
            return ^double(NSTimeInterval elapsed,NSTimeInterval duration){
                double position = elapsed/duration;
                return -position*(position - 2.0);
            };
        }
            break;
        case easeInOutQuad:
        {

        }
            break;
        case easeInCubic:
        {

        }
            break;
        case easeOutCubic:
        {

        }
            break;
        case easeInOutCubic:
        {

        }
            break;
        case easeInQuart:
        {

        }
            break;
        case easeOutQuart:
        {

        }
            break;
        case easeInOutQuart:
        {

        }
            break;
        case easeInQuint:
        {

        }
            break;
        case easeOutQuint:
        {

        }
            break;
        case easeInOutQuint:
        {

        }
            break;
        case easeInSine:
        {

        }
            break;
        case easeOutSine:
        {
            
        }
            break;
        case easeInOutSine:
        {
            
        }
            break;
        case easeInExpo:
        {
            
        }
            break;
        case easeOutExpo:
        {
            
        }
            break;
        case easeInOutExpo:
        {
            
        }
            break;
        case easeInCirc:
        {
            
        }
            break;
        case easeOutCirc:
        {
            
        }
            break;
        case easeInOutCirc:
        {
            
        }
            break;
        case easeInElastic:
        {
            
        }
            break;
        case easeOutElastic:
        {
            
        }
            break;
        case easeInOutElastic:
        {
            
        }
            break;
        case easeInBack:
        {
            
        }
            break;
        case easeOutBack:
        {
            
        }
            break;
        case easeInOutBack:
        {
            
        }
            break;
        case easeInBounce:
        {
            
        }
            break;
        case easeOutBounce:
        {
            
        }
            break;
        case easeInOutBounce:
        {
            
        }
            break;

        default:
            break;
    }
    return ^double(NSTimeInterval elapsed,NSTimeInterval duration){
        return elapsed/duration;
    };
}


#endif /* ChartAnimationEasing_h */
