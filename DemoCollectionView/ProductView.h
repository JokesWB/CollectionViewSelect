//
//  ProductView.h
//  DemoCollectionView
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductView : UIView


//多选用这个
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title ImageArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray TitleColorNomal:(UIColor *)colorNomal TitleColorSelected:(UIColor *)colorSelected CanSelectedMoreBlock:(void (^)(NSArray *selectedArr))moreBlock;

//单选用这个
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title ImageArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray TitleColorNomal:(UIColor *)colorNomal TitleColorSelected:(UIColor *)colorSelected SingleSelectedBlock:(void (^)(NSString *selectedStr))singleBlock;

@end
