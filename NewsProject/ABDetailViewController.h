//
//  ABDetailViewController.h
//  NewsProject
//
//  Created by Артем on 19.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABNews.h"

@interface ABDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray* newsArray;
@property (strong, nonatomic) NSString* articleID;
@property (strong, nonatomic) ABNews* article;
@property (strong, nonatomic) NSString* urlString;

@end
