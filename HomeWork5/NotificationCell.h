//
//  NotificationCell.h
//  HomeWork5
//
//  Created by Kelly Xu on 4/5/14.
//  Copyright (c) 2014 iosbootcamp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *myText;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end
