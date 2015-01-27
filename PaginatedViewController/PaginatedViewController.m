//
//  PaginatedViewController.m
//  challenge
//
//  Created by alfonso on 15/12/14.
//  Copyright (c) 2014 Idealmonkey. All rights reserved.
//

#import "PaginatedViewController.h"

@interface PaginatedViewController () <UIScrollViewDelegate>

@end

@implementation PaginatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.bounds.size.height) {
        
        if (!self.isLoading) {
            
            [self loadingMore];
            
        }
        
    }

}

- (void)loadingMore {
    
    NSLog(@"loadingMore");
    
    if (self.currentPage < self.totalPage) {
        
        self.isLoading = YES;
        [self.paginatedDelegate addNewPage];
        
    }
    
}

@end
