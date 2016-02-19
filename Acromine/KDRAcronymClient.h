//
//  KDRAcronymClient.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDRAcronymClient : NSObject

typedef void (^KDRClientLongformsForTermCompletion)(BOOL success, NSArray *responseObject);
- (NSURLSessionDataTask *)longformsForTerm:(NSString *)term completion:(KDRClientLongformsForTermCompletion)completion;

@end
