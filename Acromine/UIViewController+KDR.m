//
//  UIViewController+KDR.m
//  Acromine
//
//  Created by Kyle Robson on 2/19/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "UIViewController+KDR.h"
#import "UIStoryboard+KDR.h"

@implementation UIViewController (KDR)

#pragma mark - external

+ (id)loadFromStoryboard {
    return [[UIStoryboard storyboardWithClass:[self class]] instantiateInitialViewController];
}

@end
