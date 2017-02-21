//
//  MainTextInfoCell.m
//  NewsProject
//
//  Created by Артем on 19.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "MainTextInfoCell.h"
#import "ABWebViewController.h"
#import "ABDetailViewController.h"

@implementation MainTextInfoCell

- (IBAction)sourceButtonAction:(UIButton *)sender {
    
    [self.delegate didTapSourceButtonInCell:self];
}
@end
