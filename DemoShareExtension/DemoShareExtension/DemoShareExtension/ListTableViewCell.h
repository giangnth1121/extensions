//
//  ListTableViewCell.h
//  DemoShareExtension
//
//  Created by Nguyen Ha Giang on 3/30/16.
//  Copyright © 2016 Nguyen Ha Giang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblSite;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@end
