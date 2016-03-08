//
//  NSMutableDictionary+MPTitleAttribute.h
//  冒泡新闻
//
//  Created by 小葵花 on 16/3/2.
//  Copyright © 2016年 泡泡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (MPTitleAttribute)

//自定义标题属性
+ (NSMutableDictionary *)titleAttributeWithFont:(UIFont *)font withColor:(UIColor *)color;

@end
