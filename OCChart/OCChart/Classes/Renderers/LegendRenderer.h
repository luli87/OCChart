//
//  LegendRenderer.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "Renderer.h"
#import "Legend.h"

@interface LegendRenderer : Renderer
@property (strong,nonatomic) Legend * legend;
-(id)init:(ViewPortHandler *)viewPortHandler legend:(Legend *)legend;
@end
