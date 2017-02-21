//
//  ABWebViewController.m
//  NewsProject
//
//  Created by Артем on 05.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "ABWebViewController.h"
#import "TableViewController.h"

@interface ABWebViewController ()

@end

@implementation ABWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    [self.view addSubview:self.webView];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
    doneButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 35, CGRectGetMaxY(self.view.bounds) - 100, CGRectGetWidth(self.view.bounds)/6, 50);
    
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [doneButton.titleLabel setFont:[UIFont systemFontOfSize:22.0]];
    
    [doneButton addTarget:self
               action:@selector(doneButtonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.webView addSubview:doneButton];
    
    
}

- (IBAction)doneButtonAction:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
