
//
//  GPPackingListViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/6.
//  Copyright © 2017年 郭鹏. All rights reserved.
//

#import "GPPackingListViewController.h"

@interface GPPackingListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *rootTableView;
@property (nonatomic,strong) NSArray *titleArray;
@end

@implementation GPPackingListViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}
#pragma mark - 初始化
- (void)setNav
{
    self.rootTableView.rowHeight = SCREEN_HEIGHT * 0.13;
    self.rootTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addbtnClick)];
}
#pragma mark - 内部方法
- (void)addbtnClick
{
    
}
#pragma mark - 表格数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.titleArray[indexPath.row];
    NSString *tempStr = [NSString stringWithFormat:@"summericons_100px_0%ld",indexPath.row];
    cell.imageView.image = [UIImage imageNamed:tempStr];
    return cell;
}
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"冰淇淋",@"晴天",@"沙滩排球",@"男士泳衣",@"女士泳衣",@"沙滩游戏",@"冲浪板",@"鸡尾酒",@"太阳镜",@"人字拖"];
    }
    return _titleArray;
}

@end
