//
//  TableViewController.h
//  NewsProject
//
//  Created by Артем on 02.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray* newsArray;

- (IBAction)refreshAction:(UIBarButtonItem *)sender;

@end
