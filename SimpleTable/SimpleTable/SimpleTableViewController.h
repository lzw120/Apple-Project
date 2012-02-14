//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController 
<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *listData;
}
@property (nonatomic, retain)NSArray *listData;

@end
