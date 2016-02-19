//
//  NSDictionary+KDR.h
//  Acromine
//
//  Created by Kyle Robson on 2/19/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (KDR)

- (NSString *)stringOrNilForKey:(NSString *)key;
- (NSArray *)arrayOrNilForKey:(NSString *)key;

@end
