
//
//  GPPackingListViewController.m
//  GPAnimationLearning
//
//  Created by 郭鹏 on 2017/4/6.
//  Copyright © 2017年 郭鹏. All rights reserved.
//
#import "GPPackingListViewController.h"
#import "GPHorizontalItemListView.h"

@interface GPPackingListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addbtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *rootTableView;
@property (nonatomic, strong) GPHorizontalItemListView *horizonListView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *cellTitleArray;
@property (nonatomic, assign,getter=isMenuOpen) BOOL menuOpen;
// 约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleCenterX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleCenterY;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewH;
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
 
    self.menuOpen = !self.menuOpen;
    // 更新标题动画
    self.titleCenterX.constant = self.isMenuOpen ? -100.0 : 0.0;
    self.titleCenterY.constant = self.isMenuOpen ? -25 : 0.0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    // 更新标题视图动画
    self.topViewH.constant = self.isMenuOpen ? 200.0 : 60.0;
    self.titleLabel.text = self.isMenuOpen ? @"选择物品" : @"购物列表";

    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGFloat angle = self.isMenuOpen ? M_PI * 0.25 : 0.0;
        self.addBtn.transform = CGAffineTransformMakeRotation(angle);
        [self.view layoutIfNeeded];
    } completion:nil];
    
    // 添加选择栏
    if (self.isMenuOpen) {
     
        
        
        
    }
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
