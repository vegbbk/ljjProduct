//
//  myViewController.m
//  shuoyeahProject
//
//  Created by shuoyeah on 16/7/28.
//  Copyright © 2016年 shuoyeah. All rights reserved.
//

#import "myViewController.h"

@interface myViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation myViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTable];
    // Do any additional setup after loading the view.
}

- (void)createTable{

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
   // [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@""];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1f;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 0;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"测试一下";
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

#pragma mark ---------DZNEmptyDataSetSource------

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{

   NSString * string = @"测试一下";
    return [[NSAttributedString alloc]initWithString:string attributes:nil];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}



//返回标题文字
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"测试测试.jpeg"];
}
//返回详情文字
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{ NSString *text = @"This allows you to share photos from your library and save photos to your camera roll."; NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new]; paragraph.lineBreakMode = NSLineBreakByWordWrapping; paragraph.alignment = NSTextAlignmentCenter; NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f], NSForegroundColorAttributeName: [UIColor lightGrayColor], NSParagraphStyleAttributeName: paragraph}; return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
//返回可以点击的按钮 上面带文字
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{ NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
}
//点击button
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{ // Do something

    NSLog(@"趋势啊");

}
//点击空白区域
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView{ // Do something
    
    NSLog(@"趋势啊");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
