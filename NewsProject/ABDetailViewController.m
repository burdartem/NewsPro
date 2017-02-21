//
//  ABDetailViewController.m
//  NewsProject
//
//  Created by Артем on 19.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "ABDetailViewController.h"
#import "SimpleCell.h"
#import "TableViewController.h"
#import "UIImageView+AFNetworking.h"
#import "HeaderImageCell.h"
#import "MainTextInfoCell.h"
#import "ABWebViewController.h"

@interface ABDetailViewController () <MainInfoCellDelegate>

@end

@implementation ABDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SimpleCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderImageCell" bundle:nil] forCellReuseIdentifier:@"HeaderCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTextInfoCell" bundle:nil] forCellReuseIdentifier:@"MainTextInfo"];
        
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.tableView = tableView;
    return [self.newsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger myInt = [self.articleID intValue] - 1;
    self.article = [self.newsArray objectAtIndex:myInt];
    
    if (indexPath.row == 0) {
        
        static NSString* identifier = @"HeaderCell";
        
        self.tableView = tableView;
        
        HeaderImageCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[HeaderImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.article.title];
        cell.dateLabel.text = [NSString stringWithFormat:@"%@", self.article.date];
        [cell.headerImageView setImageWithURL:self.article.bigImageUrl];
        
        return cell;
        
    } else if(indexPath.row == 1){
        
        static NSString* identifier = @"MainTextInfo";
        
        self.tableView = tableView;
        
        MainTextInfoCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MainTextInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.mainTextLabel.text = [NSString stringWithFormat:@"%@", self.article.descriptionNews];
        cell.delegate = self;
        
        return cell;
        
    } else{
        
        static NSString* identifier = @"NewsCell";
        
        self.tableView = tableView;
        
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
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 354;
    } else if(indexPath.row == 1){
        return 201;
    }else{
        return 150;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row != 0 || indexPath.row != 1){
       
        ABDetailViewController* detailVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABDetailControlerIdentifire"];
        ABNews* news = [self.newsArray objectAtIndex:indexPath.row];
        detailVc.articleID = news.articleID;
        detailVc.newsArray = self.newsArray;
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}

#pragma mark - MainInfoCellDelegate

- (void) didTapSourceButtonInCell:(UITableViewCell *)cell{
    
    ABWebViewController* web = [[ABWebViewController alloc] init];
    self.urlString = self.article.urlString;
    web.urlString = self.urlString;
    [self presentViewController:web animated:YES completion:nil];
}

@end
