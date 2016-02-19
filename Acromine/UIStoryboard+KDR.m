//
//  UIStoryboard+KDR.m
//  Acromine
//
//  Created by Kyle Robson on 2/19/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "UIStoryboard+KDR.h"

@implementation UIStoryboard (KDR)

#pragma mark - external

+ (instancetype)storyboardWithClass:(Class)aClass {
    return [self storyboardWithName:NSStringFromClass(aClass) bundle:nil];
}

@end
