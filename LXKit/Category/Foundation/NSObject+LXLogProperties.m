//
//  NSObject+LXLogProperties.m
//  LXKit
//
//  Created by 徐良华 on 2018/2/28.
//  Copyright © 2018年 Lyon. All rights reserved.
//

#import "NSObject+LXLogProperties.h"

#import <objc/runtime.h>

@implementation NSObject (LXLogProperties)

- (void)logAllProperties
{
    NSMutableString *description = [NSMutableString stringWithString:@"\n**************** begin \n"];
    [description appendString:[NSString stringWithFormat:@"%@ :\n",NSStringFromClass([self class])]];
    Class cls = [self class];
    while (cls != [NSObject class]) {
        [description appendString:[self classPropertiesDescriptionWithClass:cls]];
        cls = [cls superclass];
    }
    [description appendString:@"**************** end "];
    NSLog(@"%@",description);
}

- (NSString *)classPropertiesDescriptionWithClass:(Class)cls {
    
    NSMutableString *description = [NSMutableString string];
    uint count;
    objc_property_t *properties = class_copyPropertyList(cls, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        if ([propertyName isEqualToString:@"debugDescription"] ||
            [propertyName isEqualToString:@"description"] ||
            [propertyName isEqualToString:@"superclass"] ||
            [propertyName isEqualToString:@"hash"]) {
            continue;
        }
        
        id propertyValue = [self valueForKey:propertyName];
        [description appendString:[NSString stringWithFormat:@" |- %@ : %@\n",propertyName,propertyValue]];
    }
    free(properties);
    return [description copy];
}
@end
