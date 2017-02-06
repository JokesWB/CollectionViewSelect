//
//  ProductCollectionViewCell.m
//  DemoCollectionView
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "ProductCollectionViewCell.h"


@implementation ProductCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self showImageView];
    [self titleLable];
}

- (void)setIsClick:(BOOL)isClick
{
    _isClick = isClick;
    if (_isClick) {
        self.showImageView.backgroundColor = _selectedColor;
        self.titleLable.textColor = _selectedColor;
    } else {
        self.showImageView.backgroundColor = _noamlColor;
        self.titleLable.textColor = _noamlColor;
    }
}


- (UIImageView *)showImageView
{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width - 10, self.frame.size.height - 30)];
        _showImageView.layer.cornerRadius = (self.frame.size.height - 30) * 0.5;
        _showImageView.layer.masksToBounds = YES;
        _showImageView.backgroundColor = [UIColor grayColor];
        [self addSubview:_showImageView];
    }
    return _showImageView;
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.showImageView.frame), self.frame.size.width, 30)];
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLable];
    }
    return _titleLable;
}


@end
