//
//  KDRAcronymClient.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRAcronymClient.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const kGetAcronymMeanings = @"/software/acromine/dictionary.py";

@interface KDRAcronymClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation KDRAcronymClient

#pragma mark - super

- (instancetype)init {
    if (self = [super init]) {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.nactem.ac.uk"]];
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    }
    return self;
}

#pragma mark - external

- (NSURLSessionDataTask *)longformsForTerm:(NSString *)term completion:(KDRClientLongformsForTermCompletion)completion {
    NSURLSessionDataTask *task = [self.sessionManager GET:kGetAcronymMeanings parameters:@{ @"sf": term ?: @"" } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completion && [responseObject isKindOfClass:[NSArray class]]) {
            completion(YES, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(NO, nil);
        }
    }];
    return task;
}

@end
