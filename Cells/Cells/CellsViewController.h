//
//  CellsViewController.h
//  Cells
//
//  Created by Zewen Li on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kNameValueTag 1
#define kColourValueTag 2

@interface CellsViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource> {
    NSArray *computers;   
}
@property (nonatomic, retain) NSArray *computers;

@end
