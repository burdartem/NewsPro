//
//  UINavigationController+UINavigationController_TransparentNavigationController.m
//  NewsProject
//
//  Created by Артем on 05.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "UINavigationController+UINavigationController_TransparentNavigationController.h"

@implementation UINavigationController (TransparentNavigationController)

- (void)presentTransparentNavigationBar
{
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self setNavigationBarHidden:NO animated:YES];
}

- (void)hideTransparentNavigationBar
{
    [self setNavigationBarHidden:YES animated:NO];
    [self.navigationBar setBackgroundImage:[[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTranslucent:[[UINavigationBar appearance] isTranslucent]];
    [self.navigationBar setShadowImage:[[UINavigationBar appearance] shadowImage]];
}

@end
