# PaginatedView

Installation
------------

Add the PaginatedView folder to your project.

Usage
-----

- In your view controller:
```
  @interface ViewController : PaginatedViewController

```
- Add PaginatedViewControllerDelegate
- In viewDidLoad, init currentPage and totalPage variables and add paginatedDelegate.
```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.paginatedDelegate = self;
    self.currentPage = CURRENT_PAGE;
    self.totalPage = TOTAL_PAGE;
    
}

```

- Add delegate method:
```
  - (void)addNewPage {
     // Your code
     self.isLoading = NO; // IMPORTANT!!!!
  }
```

# Requirements

Requires iOS 5.0 and ARC.
