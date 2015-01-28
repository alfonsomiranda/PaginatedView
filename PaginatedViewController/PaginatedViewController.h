//
//  PaginatedViewController.h
//
//  Created by alfonso on 15/12/14.
//  Copyright (c) 2014 alfonsomiranda. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PaginatedViewControllerDelegate <NSObject>

- (void)addNewPage;

@end

@interface PaginatedViewController : UIViewController

@property(nonatomic) id<PaginatedViewControllerDelegate> paginatedDelegate;
@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, assign) NSInteger totalPage;
@property(nonatomic) BOOL isLoading;

@end
