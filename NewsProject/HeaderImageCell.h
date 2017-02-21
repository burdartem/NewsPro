//
//  HeaderImageCell.h
//  NewsProject
//
//  Created by Артем on 19.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
