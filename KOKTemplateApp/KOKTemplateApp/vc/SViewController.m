//
//  SViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 17/12/2020.
//

#import "SViewController.h"
#import "SDCycleScrollView.h"
@interface SViewController ()
//<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *array;

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *urlArray = (NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:@"giftCards"];
    self.array = [NSMutableArray array];
    for (NSString *url in urlArray) {
        UIImage *ime= [self getCacheImageUseImagePath:url];
        [self.array addObject:ime];
    }
    
    SDCycleScrollView *introduceCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)
                                                                           shouldInfiniteLoop:YES imageNamesGroup:self.array];
    introduceCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    __weak __typeof(self)weakSelf = self;
    introduceCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        
        NSString *shareText = @"sharetitle";
        UIImage *shareImage =  weakSelf.array.firstObject;
            NSURL *shareURL = [NSURL URLWithString:@"https://www.baidu.com/"];
            NSArray *activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage, shareURL, nil];
            
            UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
            
            UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                NSLog(@"%@",activityType);
                if (completed) {
                    NSLog(@"分享成功");
                } else {
                    NSLog(@"分享失败");
                }
                [vc dismissViewControllerAnimated:YES completion:nil];
            };
            
            vc.completionWithItemsHandler = myBlock;
            
            [weakSelf presentViewController:vc animated:YES completion:nil];

    };
    [self.view addSubview:introduceCycleScrollView];
    
}

- (UIImage *)getCacheImageUseImagePath:(NSString *)imagePath
{
    //防止每次启动程序沙盒前缀地址改变,只存储后边文件路径,调用时再次拼接
    NSString *imageAllPath = [NSHomeDirectory() stringByAppendingPathComponent:imagePath];
    return [UIImage imageWithContentsOfFile:imageAllPath];
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
