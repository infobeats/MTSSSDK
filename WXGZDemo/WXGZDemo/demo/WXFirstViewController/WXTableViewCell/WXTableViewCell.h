//
//  WXTableViewCell.h
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SGXib.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *myTitle;

@end

NS_ASSUME_NONNULL_END
