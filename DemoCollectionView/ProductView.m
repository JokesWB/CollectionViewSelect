//
//  ProductView.m
//  DemoCollectionView
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "ProductView.h"
#import "ProductCollectionViewCell.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

static NSString *cellIndentifier = @"cell";

@interface ProductView ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSString *_title;
    NSArray *_imageArray;
    NSArray *_titleArray;
    UIColor *_colorNomal;
    UIColor *_colorSelected;
    BOOL _canSelectedMore;
}

@property (nonatomic , strong) UILabel *markLabel;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , copy) void (^moreBlock)(NSArray *selectedArr);
@property (nonatomic , copy) void (^singleBlock)(NSString *selectedStr);
@property (nonatomic , strong) NSMutableArray *selectedArr;

@end

@implementation ProductView

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title ImageArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray TitleColorNomal:(UIColor *)colorNomal TitleColorSelected:(UIColor *)colorSelected CanSelectedMoreBlock:(void (^)(NSArray *))moreBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _title = title;
        _imageArray = imageArray;
        _titleArray = titleArray;
        _colorNomal = colorNomal;
        _colorSelected = colorSelected;
        _canSelectedMore = YES;
        self.moreBlock = moreBlock;
        [self collectionView];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title ImageArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray TitleColorNomal:(UIColor *)colorNomal TitleColorSelected:(UIColor *)colorSelected SingleSelectedBlock:(void (^)(NSString *))singleBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _title = title;
        _imageArray = imageArray;
        _titleArray = titleArray;
        _colorNomal = colorNomal;
        _colorSelected = colorSelected;
        _canSelectedMore = NO;
        self.singleBlock = singleBlock;
        [self collectionView];
        
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    
    cell.titleLable.text = _titleArray[indexPath.row];
    cell.noamlColor = _colorNomal;
    cell.selectedColor = _colorSelected;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"选中了 %ld", indexPath.row);
    ProductCollectionViewCell *cell = (ProductCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isClick = !cell.isClick;
    
    //把选中的标题加到 selectedArr 中
    if (cell.isClick) {
        [self.selectedArr addObject:_titleArray[indexPath.row]];
    } else {
        [self.selectedArr removeObject:_titleArray[indexPath.row]];
    }
    
    
    if (!_canSelectedMore) {
        //单选
        if (cell.isClick) {
            self.singleBlock(_titleArray[indexPath.row]);
        } else {
            self.singleBlock(@"");
        }
    } else {
        //多选
        self.moreBlock(self.selectedArr);
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"不选中 %ld", indexPath.row);
    if (_canSelectedMore) {
        return;
    }
    ProductCollectionViewCell *cell = (ProductCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isClick = NO;
}



- (UILabel *)markLabel
{
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW * 0.5 - 60, 0, 120, 30)];
        _markLabel.textColor = [UIColor orangeColor];
        _markLabel.textAlignment = NSTextAlignmentCenter;
        _markLabel.text = _title;
        [self addSubview:_markLabel];
    }
    return _markLabel;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.itemSize = CGSizeMake(60, 80);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.markLabel.frame), self.frame.size.width, self.frame.size.height - 30) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:cellIndentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        
    }
    return _collectionView;
}


- (NSMutableArray *)selectedArr
{
    if (!_selectedArr) {
        _selectedArr = [NSMutableArray array];
    }
    return _selectedArr;
}




@end
