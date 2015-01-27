//
//  ViewController.m
//  PaginatedViewSample
//
//  Created by Alfonso Miranda Castro on 27/1/15.
//  Copyright (c) 2015 Alfonso Miranda Castro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, PaginatedViewControllerDelegate>

@property(nonatomic, strong) IBOutlet UITableView *theTableView;
@property(nonatomic, strong) UIView *footerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.paginatedDelegate = self;
    self.currentPage = 1;
    self.totalPage = 20;
    
    self.footerView = [self paginationLoadingView];
    self.theTableView.tableFooterView = self.footerView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.currentPage*20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Page %ld", indexPath.row / 20];
    
    return cell;
    
}

#pragma -
#pragma Private Methods

- (UIView *)paginationLoadingView {
    
    UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.frame = CGRectMake((loadingView.frame.size.width - activity.frame.size.width) / 2, (loadingView.frame.size.height - activity.frame.size.height) / 2,
                                activity.frame.size.width, activity.frame.size.height);
    [activity startAnimating];
    [loadingView addSubview:activity];
    
    return loadingView;
    
}

#pragma -
#pragma PaginatedViewController Delegate

- (void)addNewPage {
    
    self.currentPage ++;
    
    if (self.currentPage < self.totalPage) {
        
        self.theTableView.tableFooterView = self.footerView;
        
    }
    else {
        
        self.theTableView.tableFooterView = nil;
        
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.theTableView reloadData];
        self.isLoading = NO;
    });
    
    
}

@end
