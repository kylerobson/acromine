//
//  NSString+KDR.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "NSString+KDR.h"

@implementation NSString (KDR)

#pragma mark - external

- (BOOL)hasUsefulLength {
    return (self != nil && [self trimmedString].length > 0);
}

- (NSString *)trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)isEqualCaseInsensitiveToString:(NSString *)string {
    return [self.lowercaseString.trimmedString isEqualToString:string.lowercaseString.trimmedString];
}

@end
