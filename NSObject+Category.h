//
//  NSObject+Category.h
//  Runtime字典转模型
//
//  Created by JackeyChen on 16/4/16.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
