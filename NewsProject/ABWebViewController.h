//
//  ABWebViewController.h
//  NewsProject
//
//  Created by Артем on 05.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) UIWebView* webView;
@property (strong, nonatomic) NSString* urlString;
@property (strong, nonatomic) UIActivityIndicatorView* indicator;

@end
