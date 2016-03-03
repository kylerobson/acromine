//
//  KDRAcronymsViewController.m
//  Acromine
//
//  Created by Kyle Robson on 2/18/16.
//  Copyright © 2016 Kyle Robson. All rights reserved.
//

#import "KDRAcronymsViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "KDRAcronymService.h"
#import "KDRCancellableBlock.h"
#import "KDRLongform.h"

static NSString * const kCellID = @"Cell";

@interface KDRAcronymsViewController () <UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) KDRAcronymService *service;
@property (nonatomic, copy) NSArray *longforms;
@property (nonatomic, copy) KDRCancellableBlock searchCancel;

@end

@implementation KDRAcronymsViewController

#pragma mark - external

- (void)setupWithService:(KDRAcronymService *)service {
    self.service = service;
}

#pragma mark - internal

- (void)searchForTerm:(NSString *)term {
    KDRCancelBlock(self.searchCancel);
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak KDRAcronymsViewController *welf = self;
    self.searchCancel = [self.service longformsForTerm:term completion:^(BOOL success, BOOL cancelled, NSArray *longforms) {
        if (!cancelled) {
            if (success) {
                welf.longforms = longforms;
                [welf.tableView reloadData];
            }
            else {
                [welf showError];
            }
            [MBProgressHUD hideAllHUDsForView:welf.view animated:YES];
        }
    }];
}

- (void)showError {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Unable to lookup longforms. Please check your internet connection.", nil) preferredStyle:UIAlertControllerStyleAlert];
    __weak KDRAcronymsViewController *welf = self;
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [welf dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - internal UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchForTerm:searchBar.text];
}

#pragma mark - internal UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.longforms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellID];
    KDRLongform *longform = self.longforms[indexPath.row];
    cell.textLabel.text = longform.text;
    return cell;
}

@end
