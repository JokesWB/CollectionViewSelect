//
//  ViewController.m
//  DemoCollectionView
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "ViewController.h"
#import "ProductView.h"

@interface ViewController ()
{
    NSString *_seleStr;
    NSArray *_seleArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imageArray1 = @[@"qingba", @"haiba", @"ktv"];
    NSArray *titleArray1 = @[@"清吧", @"嗨吧", @"商务KTV"];
    
    NSArray *imageArray2 = @[@"qingba", @"haiba", @"ktv", @"qingba", @"haiba", @"ktv", @"qingba", @"haiba", @"ktv", @"qingba", @"haiba", @"ktv", @"qingba", @"haiba"];
    NSArray *titleArray2 = @[@"清吧", @"嗨吧", @"商务KTV", @"电影", @"足球", @"左丘", @"娱乐", @"视频", @"小品", @"哈哈", @"嘿嘿", @"呵呵", @"你好啊", @"我不好"];
    
    //单选
    ProductView *proView1 = [[ProductView alloc] initWithFrame:CGRectMake(0, 100, 375, 110) Title:@"分类" ImageArray:imageArray1 TitleArray:titleArray1 TitleColorNomal:[UIColor grayColor] TitleColorSelected:[UIColor blueColor] SingleSelectedBlock:^(NSString *selectedStr) {
        
        _seleStr = selectedStr;
    }];
    [self.view addSubview:proView1];
 
    //多选
    ProductView *proView2 = [[ProductView alloc] initWithFrame:CGRectMake(0, 250, 375, 200) Title:@"心情" ImageArray:imageArray2 TitleArray:titleArray2 TitleColorNomal:[UIColor grayColor] TitleColorSelected:[UIColor blueColor] CanSelectedMoreBlock:^(NSArray *selectedArr) {
        
        _seleArr = selectedArr;
    }];
    [self.view addSubview:proView2];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 500, 80, 30);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonAction
{
    NSString *str = [_seleArr componentsJoinedByString:@" > "];
    NSLog(@"单选 -- %@,   多选 -- %@", _seleStr, str);
    
}


@end
