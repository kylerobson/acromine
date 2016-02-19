//
//  NSDictionary+KDR.m
//  Acromine
//
//  Created by Kyle Robson on 2/19/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "NSDictionary+KDR.h"

@implementation NSDictionary (KDR)

#pragma mark - external

- (NSString *)stringOrNilForKey:(NSString *)key {
    return [self objectOrNilForKey:key class:[NSString class]];
}

- (NSArray *)arrayOrNilForKey:(NSString *)key {
    return [self objectOrNilForKey:key class:[NSArray class]];
}

#pragma mark - internal

- (id)objectOrNilForKey:(NSString *)key class:(Class)aClass {
    NSString *value = [self objectForKey:key];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    return nil;
}

@end
