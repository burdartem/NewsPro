//
//  MainTextInfoCell.h
//  NewsProject
//
//  Created by Артем on 19.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainInfoCellDelegate <NSObject>

- (void) didTapSourceButtonInCell:(UITableViewCell*) cell;

@end

@interface MainTextInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;
@property (weak, nonatomic) id<MainInfoCellDelegate> delegate;

- (IBAction)sourceButtonAction:(UIButton *)sender;

@end
