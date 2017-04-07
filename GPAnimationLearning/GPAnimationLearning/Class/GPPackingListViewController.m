
//
//  GPPackingListViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/6.
//  Copyright © 2017年 郭鹏. All rights reserved.
//
#import "GPPackingListViewController.h"

@interface GPPackingListViewController ()<UITableViewDelegate,UITableViewDataSource>
- (IBAction)addbtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *rootTableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *cellTitleArray;
@end

@implementation GPPackingListViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
#pragma mark - 初始化
- (void)setNav
{
    self.rootTableView.rowHeight = SCREEN_HEIGHT * 0.13;
}
#pragma mark - 内部方法
- (IBAction)addbtnClick:(id)sender {
 
    
}
#pragma mark - 表格数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.titleArray[[self.cellTitleArray[indexPath.row] integerValue]];
    NSString *tempStr = [NSString stringWithFormat:@"summericons_100px_0%@",self.cellTitleArray[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:tempStr];
    return cell;
}
#pragma mark - 懒加载
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"冰淇淋",@"晴天",@"沙滩排球",@"男士泳衣",@"女士泳衣",@"沙滩游戏",@"冲浪板",@"鸡尾酒",@"太阳镜",@"人字拖"];
    }
    return _titleArray;
}
- (NSArray *)cellTitleArray
{
    if (!_cellTitleArray) {
        _cellTitleArray = @[@"5",@"6",@"7"];
    }
    return _cellTitleArray;
}

@end
