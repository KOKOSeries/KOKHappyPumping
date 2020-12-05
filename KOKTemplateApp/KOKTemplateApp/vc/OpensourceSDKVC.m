//
//  OpensourceSDKVC.m
//  KOKTemplateApp
//
//  Created by KOK on 5/12/2020.
//

#import "OpensourceSDKVC.h"
#import <SafariServices/SafariServices.h>
@interface OpensourceSDKVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *array;

@end

@implementation OpensourceSDKVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Open Source List";
    self.view.backgroundColor = [UIColor colorNamed:@"tintColor"];
}

- (NSMutableDictionary * )getDataFromPlist{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"opensourceSDKdata" ofType:@"plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"%@",dataDic);//直接打印数据
    return dataDic;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OpensourceSDKVCCellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OpensourceSDKVCCellID"];
        
    }
    cell.backgroundColor = [UIColor colorNamed:@"tintColor"];
    NSDictionary *dic = self.array[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.array[indexPath.row];
    NSURL *url = [NSURL URLWithString:dic[@"url"]];
    SFSafariViewController *vc = [[SFSafariViewController alloc]initWithURL:url];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:^{
            
    }];
}
- (NSMutableArray *)array{
    if (!_array) {
        NSMutableDictionary *dictiony =  [self getDataFromPlist];
        NSArray *array = dictiony[@"opensource"];
        _array = [NSMutableArray arrayWithArray:array];
    }
    return _array;
}
@end
