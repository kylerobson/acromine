//
//  KDRAppDelegate.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRAppDelegate.h"
#import "KDRAcronymClient.h"
#import "KDRAcronymService.h"
#import "KDRAcronymsViewController.h"
#import "UIViewController+KDR.h"

@interface KDRAppDelegate ()

@property (nonatomic, strong) KDRAcronymClient *client;
@property (nonatomic, strong) KDRAcronymService *service;

@end

@implementation KDRAppDelegate

#pragma mark - super

- (instancetype)init {
    if (self = [super init]) {
        self.window = [UIWindow new];
        self.client = [KDRAcronymClient new];
        self.service = [KDRAcronymService new];
        [self.service setupWithClient:self.client];
    }
    return self;
}

#pragma mark - external UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    KDRAcronymsViewController *acronymsViewController = [KDRAcronymsViewController loadFromStoryboard];
    [acronymsViewController setupWithService:self.service];
    self.window.rootViewController = acronymsViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
