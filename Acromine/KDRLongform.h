//
//  KDRLongform.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRObject.h"
#import "KDRDictionaryUpdating.h"

@interface KDRLongform : KDRObject <KDRDictionaryUpdating>

@property (nonatomic, copy) NSString *text;

@end

extern const struct KDRLongformAttributes {
    __unsafe_unretained NSString *text;
} KDRLongformAttributes;
