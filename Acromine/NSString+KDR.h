//
//  NSString+KDR.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KDR)

- (BOOL)hasUsefulLength;
- (NSString *)trimmedString;
- (BOOL)isEqualCaseInsensitiveToString:(NSString *)string;

@end
