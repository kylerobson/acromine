//
//  KDRAcronymsViewController.h
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KDRAcronymService;

@interface KDRAcronymsViewController : UIViewController

- (void)setupWithService:(KDRAcronymService *)service;

@end
