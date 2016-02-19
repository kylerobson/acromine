//
//  KDRAcronymService.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KDRCancellableBlock.h"
#import "KDRAcronymClient.h"

@interface KDRAcronymService : NSObject

- (void)setupWithClient:(KDRAcronymClient *)client;

typedef void (^KDRServiceLongformsForTermCompletion)(BOOL success, BOOL cancelled, NSArray *longforms);
- (KDRCancellableBlock)longformsForTerm:(NSString *)term completion:(KDRServiceLongformsForTermCompletion)completion;

@end
