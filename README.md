# PaginatedView

- Add PaginatedView folder to your project.
- In you view controller:
  @interface ViewController : PaginatedViewController
- Add PaginatedViewControllerDelegate
- In viewDidLoad, init currentPage and totalPage.
- Add self.paginatedDelegate = self;
- Add delegate method:
  - (void)addNewPage {
     // Your code
     self.isLoading = NO; // IMPORTANT!!!!
  }
