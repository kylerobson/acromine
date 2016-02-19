//
//  KDRObject.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRObject.h"

@implementation KDRObject

#pragma mark - external

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    
}

+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary {
    KDRObject *object = [self new];
    [object updateWithDictionary:dictionary];
    return object;
}

@end
