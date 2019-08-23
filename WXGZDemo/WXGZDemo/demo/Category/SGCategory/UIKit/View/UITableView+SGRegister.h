//
//  UITableViewController+SGRegister.h
//  SGCategoryUnit
//
//  Created by Shangen Zhang on 2018/8/12.
//  Copyright © 2018年 Flame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SGRegister)
/**
 regist cell form xib for table view
 --ps: cell xib name must equal cell class name
 
 @param cellClass class for reuse cell
 @return reuse identitfer (equal to cellClass class name)
 */
- (NSString *)sg_registerNibWithCellClass:(Class)cellClass;


/**
 regist cell from class for table view
 
 @param cellClass class for reuse cell
 @return reuse identitfer (equal to cellClass class name)
 */
- (NSString *)sg_registerCellClass:(Class)cellClass;


/**
 get reused cell
 
 @param cellClass reused cell class
 @return cell which class if member of 'cellClass'
 */
- (UITableViewCell *)sg_getReusedCellWithClass:(Class)cellClass;
@end
