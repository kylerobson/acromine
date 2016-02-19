//
//  KDRAcronymParser.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRAcronymParser.h"
#import "NSString+KDR.h"
#import "NSDictionary+KDR.h"
#import "KDRLongform.h"

@implementation KDRAcronymParser

#pragma mark - external

- (NSArray *)longformsForJSONArray:(NSArray *)JSONArray term:(NSString *)term {
    NSMutableArray *results = [NSMutableArray new];
    NSMutableSet *foundWords = [NSMutableSet new];
    for (NSDictionary *dictionary in JSONArray) {
        NSString *shortform = [dictionary stringOrNilForKey:KDRLongformParserAttributes.shortform];
        if ([shortform isEqualCaseInsensitiveToString:term]) {
            NSArray *longformDictionaries = [dictionary arrayOrNilForKey:KDRLongformParserAttributes.longforms];
            for (NSDictionary *longformDictionary in longformDictionaries) {
                KDRLongform *longform = [KDRLongform objectWithDictionary:longformDictionary];
                if (![foundWords containsObject:longform.text.lowercaseString]) {
                    [foundWords addObject:longform.text.lowercaseString];
                    [results addObject:longform];
                }
            }
        }
    }
    return [results copy];
}

@end

const struct KDRLongformParserAttributes KDRLongformParserAttributes = {
    .longforms = @"lfs",
    .shortform = @"sf",
};
