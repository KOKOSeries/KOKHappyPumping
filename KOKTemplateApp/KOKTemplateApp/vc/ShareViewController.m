//
//  ShareViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 17/12/2020.
//

#import "ShareViewController.h"
//#import "OKTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
@interface ShareViewController ()
//<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray  *array;
@property (strong,nonatomic) UITableView *tableView;

@end

@implementation ShareViewController
- (IBAction)back:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
   
    
}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.array.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    OKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OKTableViewCell"];
////    cell.imageView
//    if (cell == nil) {
//        cell = [[OKTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OKTableViewCell"];
//    }
////    if (self.array == 0) {
////
////    }else{
////        NSString *imageAllPath = [NSHomeDirectory() stringByAppendingPathComponent:self.array[indexPath.row]];
////        UIImage *image = [UIImage imageWithContentsOfFile:imageAllPath];
////        cell.cardImage.image = [UIImage imageWithContentsOfFile:imageAllPath];
////
//////        [cell.cardImage sd_setImageWithURL:[NSURL URLWithString:imageAllPath]];
////
////    }
//    return cell;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height) style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
//    [self.tableView registerNib:[UINib nibWithNibName:@"GiftCardCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GiftCardCellID"];
    NSArray *urlArray = (NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:@"giftCards"];
    self.array = [NSMutableArray arrayWithArray:urlArray];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView reloadData];
   
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  150;
}
- (UIImage *)getCacheImageUseImagePath:(NSString *)imagePath
{
    //防止每次启动程序沙盒前缀地址改变,只存储后边文件路径,调用时再次拼接
    NSString *imageAllPath = [NSHomeDirectory() stringByAppendingPathComponent:imagePath];
    return [UIImage imageWithContentsOfFile:imageAllPath];
}

@end
