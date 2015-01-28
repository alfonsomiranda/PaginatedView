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
- In viewDidLoad, init currentPage and totalPage variables and add
```
self.paginatedDelegate = self;

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
