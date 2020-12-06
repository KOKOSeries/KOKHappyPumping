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
    // Do any additional setup after loading the view from its nib.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordViewControllerCellID"];
    if (cell == nil) {
        cell = [[GiftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecordViewControllerCellID"];
    }
    
    return cell;
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
