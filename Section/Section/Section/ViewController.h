//
//  ViewController.h
//  Section
//
//  Created by Zewen Li on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>


//@property (strong, nonatomic) NSDictionary *names;
//@property (strong, nonatomic) NSArray *keys;

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UISearchBar *search;
@property (strong, nonatomic) NSDictionary *allNames;
@property (strong, nonatomic) NSMutableDictionary *names;
@property (strong, nonatomic) NSMutableArray *keys;
@property (assign, nonatomic) BOOL isSearching;

- (void) resetSearch;
- (void) handleSearchForTerm: (NSString *) searchTerm;


@end
