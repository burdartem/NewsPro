//
//  ViewController.m
//  NewsProject
//
//  Created by Артем on 31.01.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "TableViewController.h"
#import "ABServerManager.h"
#import "AFNetworking.h"
#import "ABNews.h"
#import "UIImageView+AFNetworking.h"
#import "SimpleCell.h"
#import "ABDetailViewController.h"
#import "UINavigationController+UINavigationController_TransparentNavigationController.h"

@interface TableViewController ()

@property (strong, nonatomic) ABNews* article;
@property (strong, nonatomic) NSMutableArray* arrColor;
@property (strong, nonatomic) NSString*  articleID;
@property (strong, nonatomic) NSArray* colorArray;

@end

@implementation TableViewController

static NSInteger newsInRequest = 20;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsArray = [[NSMutableArray alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SimpleCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getArticlesFromServer];
}
/*

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController presentTransparentNavigationBar];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController hideTransparentNavigationBar];
}
*/


#pragma mark - API
- (void) getArticlesFromServer{
    
    [[ABServerManager sharedManager]
     getNewsWithOffset:[self.newsArray count]
     count:newsInRequest
     onSuccess:^(NSArray *articles) {
         
         [self.newsArray addObjectsFromArray:articles];
         
         [self.tableView reloadData];
        
     } onFailure:^(NSError *error, NSInteger statusCode) {
         NSLog(@"error = %@, code = %ld", [error localizedDescription], (long)statusCode);
     }];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.newsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"NewsCell";
    
    SimpleCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[SimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    self.article = [self.newsArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", self.article.title];
    self.article.date = [self.article.date substringToIndex:10];
    cell.dateLabel.text = [NSString stringWithFormat:@"%@", self.article.date];
    
    [cell.posterImageView setImageWithURL:self.article.imageURL];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ABDetailViewController* detailVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABDetailControlerIdentifire"];
    ABNews* news = [self.newsArray objectAtIndex:indexPath.row];
    detailVc.articleID = news.articleID;
    detailVc.newsArray = self.newsArray;
    [self.navigationController pushViewController:detailVc animated:YES];
}

#pragma mark - Actions

- (IBAction)refreshAction:(UIBarButtonItem *)sender {
    
    [self getArticlesFromServer];
}
@end
