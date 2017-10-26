//
//  Renderer.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewPortHandler.h"
@interface Renderer : NSObject
@property (strong,nonatomic) ViewPortHandler * viewPortHandler;
-(id)init:(ViewPortHandler *)viewPortHandler;
@end
