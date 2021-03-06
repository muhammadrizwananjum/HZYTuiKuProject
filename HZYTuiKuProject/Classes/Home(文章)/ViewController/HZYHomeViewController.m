//
//  HZYHomeViewController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/20.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYHomeViewController.h"

#import "HZYDetailViewController.h"
#import "HZYSearchViewController.h"

@interface HZYHomeViewController ()

@end

@implementation HZYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setNav];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToDetailText:) name:HZYPushToDetailTextVCNotification object:nil];
    
    self.titleModelArray = [HZYTitleModel titleModelGetModelArrayWith:@"titleArray.plist"];
    
    [self setUI];
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


#pragma mark - 设置导航栏
/**
 *  设置导航栏
 */
-(void)setNav{
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more1"] style:UIBarButtonItemStylePlain target:self action:@selector(moreBtn)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
/**
 *  导航栏搜索(左侧)按钮
 */
-(void)searchBtn{

    HZYSearchViewController *searchVC = [[HZYSearchViewController alloc]init];
    
    HZYNavigationController *nav = [[HZYNavigationController alloc]initWithRootViewController:searchVC];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}
/**
 *  导航栏更多(右侧)按钮
 */
-(void)moreBtn{
    
}

#pragma mark - push到详细页面的通知方法
-(void)pushToDetailText:(NSNotification *)notification{
    
    HZYDetailViewController *detail = [[HZYDetailViewController alloc]init];
    
    detail.detailTextId = notification.userInfo[HZYDetailTextIdKeyd];
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
}


@end
