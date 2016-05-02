//
//  NSObject+Category.m
//  Runtime字典转模型
//
//  Created by JackeyChen on 16/4/16.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)


+(NSArray *)propertyList{
    
    unsigned int count = 0;
    
    //获取模型属性

    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //遍历数组
    for (int i = 0; i < count; i++) {
        
        //获取属性
        objc_property_t property = propertyList[i];
        
        //获取属性名称
        const char *cName = property_getName(property);
        
        NSString *name = [[NSString alloc]initWithUTF8String:cName];
        
        //把属性添加到数组中
        [arrayM addObject:name];
    
    }
    
    //释放属性数组
    free(propertyList);
    
    return arrayM.copy;
}

+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    id objc = [self new];
    
    //遍历属性数组
    for (NSString *property in [self propertyList]) {
        
        //判断数组中是否包含这个Key
        if (dict[property]) {
            
            [objc setValue:dict[property] forKey:property];
        }
        
    }
    return objc;
}

@end
