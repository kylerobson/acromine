//
//  KDRAcronymService.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRAcronymService.h"
#import "NSString+KDR.h"
#import "KDRAcronymParser.h"

@interface KDRAcronymService ()

@property (nonatomic, strong) KDRAcronymClient *client;

@end

@implementation KDRAcronymService

#pragma mark - external

- (void)setupWithClient:(KDRAcronymClient *)client {
    self.client = client;
}

- (KDRCancellableBlock)longformsForTerm:(NSString *)term completion:(KDRServiceLongformsForTermCompletion)completion {
    if (![term hasUsefulLength] && completion) {
        completion(NO, NO, nil);
        return nil;
    }
    __block BOOL cancelled = NO;
    NSURLSessionDataTask *task = [self.client longformsForTerm:term completion:^(BOOL success, NSArray *responseObject) {
        if (success) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                KDRAcronymParser *parser = [KDRAcronymParser new];
                NSArray *longforms = [parser longformsForJSONArray:responseObject term:term];
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(success, cancelled, longforms);
                    });
                }
            });
        }
        else {
            if (completion) {
                completion(success, cancelled, nil);
            }
        }
    }];
    [task resume];
    KDRCancellableBlock cancel = ^{
        cancelled = YES;
        [task cancel];
    };
    return cancel;
}

@end
