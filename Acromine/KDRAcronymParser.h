//
//  KDRAcronymParser.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDRAcronymParser : NSObject

- (NSArray *)longformsForJSONArray:(NSArray *)JSONArray term:(NSString *)term;

@end

extern const struct KDRLongformParserAttributes {
    __unsafe_unretained NSString *longforms;
    __unsafe_unretained NSString *shortform;
} KDRLongformParserAttributes;
