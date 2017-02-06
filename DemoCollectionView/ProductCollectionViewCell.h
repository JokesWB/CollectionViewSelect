//
//  ProductCollectionViewCell.h
//  DemoCollectionView
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong) UIImageView *showImageView;;
@property (nonatomic , strong) UILabel *titleLable;
@property (nonatomic , assign) BOOL isClick;
@property (nonatomic , strong) UIColor *noamlColor;
@property (nonatomic , strong) UIColor *selectedColor;


@end
