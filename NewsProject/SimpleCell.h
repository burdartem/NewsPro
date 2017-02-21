//
//  SimpleCell.h
//  NewsProject
//
//  Created by Артем on 03.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;
@property (nonatomic, weak) IBOutlet UILabel* dateLabel;
@property (nonatomic, weak) IBOutlet UIImageView* posterImageView;

@end
