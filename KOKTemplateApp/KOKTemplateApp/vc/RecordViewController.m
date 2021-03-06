//
//  RecordViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 5/12/2020.
//

#import "RecordViewController.h"
#import "GiftTableViewCell.h"
@interface RecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray *array;
//@property (strong,nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"tintColor"];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"GiftTableViewCell" bundle:nil] forCellReuseIdentifier:@"RecordViewControllerCellID"];

}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OpensourceSDKVCCellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OpensourceSDKVCCellID"];
        
    }
    cell.backgroundColor = [UIColor colorNamed:@"tintColor"];
    NSDictionary *dic = self.array[indexPath.row];
    cell.textLabel.text = dic[@"gittName"];
    cell.imageView.image = [UIImage imageNamed:dic[@"giftImage"]];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  95;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (NSMutableDictionary * )getDataFromPlist{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"GiftRecord" ofType:@"plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"%@",dataDic);//直接打印数据
    return dataDic;
}
- (NSMutableArray *)array{
    if (!_array) {
        NSMutableDictionary *dictiony =  [self getDataFromPlist];
        NSArray *array = dictiony[@"gifts"];
        _array = [NSMutableArray arrayWithArray:array];
    }
    return _array;
}
@end
