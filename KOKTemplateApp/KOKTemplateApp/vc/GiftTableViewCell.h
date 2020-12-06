//
//  GiftTableViewCell.h
//  KOKTemplateApp
//
//  Created by KOK on 5/12/2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GiftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageNaem;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end

NS_ASSUME_NONNULL_END
