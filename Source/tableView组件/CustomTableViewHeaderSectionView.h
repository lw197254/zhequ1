//
//  CustomTableViewHeaderSectionView.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/23.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ CustomTableViewHeaderSectionViewClickedBlock) (NSInteger section);
@interface CustomTableViewHeaderSectionView : UITableViewHeaderFooterView
@property(nonatomic, assign) NSInteger section;/**< 选中的section */
@property(nonatomic,strong)UILabel *titleLabel;/**< 标题 */
//    UILabel *_detailLabel;/**< 其他内容 */

@property(nonatomic,strong)UILabel *subTitleLabel;



@property(nonatomic,strong)UIView*topLine;
@property(nonatomic,strong)UIView*middleLine;
@property(nonatomic,strong)UIView*bottomLine;

-(void)setTitle:(NSString*)title subTitle:(NSString*)subTitle section:(NSInteger)section SelectedBlock:(CustomTableViewHeaderSectionViewClickedBlock)block;
@end
