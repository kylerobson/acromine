//
//  KDRLongform.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRLongform.h"
#import "NSDictionary+KDR.h"

@implementation KDRLongform

#pragma mark - external

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    [super updateWithDictionary:dictionary];
    
    self.text = [dictionary stringOrNilForKey:KDRLongformAttributes.text];
}

@end

const struct KDRLongformAttributes KDRLongformAttributes = {
    .text = @"lf",
};