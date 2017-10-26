//
//  Description.h
//  OCChart
//
//  Created by luli on 2017/10/25.
//  Copyright © 2017年 lu li. All rights reserved.
//

#import "ComponentBase.h"

@interface Description : ComponentBase
@property (strong,nonatomic) NSString * text;
@property(assign,nonatomic)CGPoint position;
@property(assign,nonatomic)NSTextAlignment textAlign;
@property (strong,nonatomic) UIFont * font;
@property (strong,nonatomic) UIColor * textColor;
@end
