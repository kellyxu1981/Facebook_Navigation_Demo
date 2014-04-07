//
//  NotificationViewController.m
//  HomeWork5
//
//  Created by Kelly Xu on 4/5/14.
//  Copyright (c) 2014 iosbootcamp. All rights reserved.
//

#import "NotificationViewController.h"
#import "PostViewController.h"
#import "NotificationCell.h"
#import "UIKit+AFNetworking.h"

@interface NotificationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *notificationTableView;
@property (nonatomic,strong) NSArray *notifications;

@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.notifications =
        @[ @{  @"name" : @"Brannon Boren",
               @"text" : @"Brannon Boren and Laura Lee posted in FarmVille Team.",
              @"profile_url" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-frc1/t1.0-9/10013616_10152305698991133_422440057_n.jpg",
              @"timestamp" : @"6 hours ago",
              @"postImage" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-prn2/t1.0-9/1495537_874728705336_1582743391_n.jpg",
              @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yT/r/L_gR5FtR_ZM.png",
               @"like": @"2 people like this."
              },
           @{  @"name" : @"Jon Martin",
               @"text" : @"Jon Martin posted in Zynga Alums:\"tap tap is this thing on. Here is a link. K byeeeee\"",
              @"profile_url" : @"https://scontent-b-sjc.xx.fbcdn.net/hphotos-prn2/t1.0-9/1979895_10152033628498564_1130389222_n.jpg",
              @"timestamp" : @"Yesterday at 10:55PM",
              @"postImage" : @"https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-frc3/t1.0-9/296760_10151069689096172_2048200111_n.jpg",
              @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/EXllo1TL4MS.png",
               @"like": @"10 people like this."
              },
           @{  @"name" : @"Mike Katzourin",
               @"text" : @"Mike Katzourin updated his status:\"My birthday today!\"",
              @"profile_url" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-prn2/t1.0-9/1385023_548156598598459_55226406_n.jpg",
              @"timestamp" : @"Yesterday at 11:20AM",
              @"postImage" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-prn1/t1.0-9/1975186_874523017536_1786815325_n.jpg",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yF/r/WRXHiilIVpw.png",
               @"like": @"5 people like this."
              },
           @{  @"name" : @"Laura Lee",
               @"text" : @"Cake of the day! Itching to go traveling...",
               @"profile_url" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-frc3/l/t1.0-9/1623595_10151882569605899_230641637_n.jpg",
               @"timestamp" : @"2 days ago",
               @"postImage" : @"https://scontent-b-sjc.xx.fbcdn.net/hphotos-prn2/t1.0-9/10171703_10151966625195899_757547308_n.jpg",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yT/r/L_gR5FtR_ZM.png",
               @"like": @"4 people like this."
               },
           @{  @"name" : @"Emily Lin",
               @"text" : @"Uploaded a new baby's picture, check it out",
               @"profile_url" : @"https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-frc1/t1.0-9/149866_1623623903201_1457766_n.jpg",
               @"timestamp" : @"April 4",
               @"postImage" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-ash2/t1.0-9/301868_2103894173556_16314498_n.jpg",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/EXllo1TL4MS.png",
               @"like": @"18 people like this."
               },
           @{  @"name" : @"Craig Woida",
               @"text" : @"We'll miss you, Matt Levine. — with Matt Levine, Sevvanthie Sachithanandan, Roger Crain, Arvin Bautista, Brian Steffel, Jesse Hernandez and Jollan Seo.",
               @"profile_url" : @"https://scontent-b-sjc.xx.fbcdn.net/hphotos-prn1/t1.0-9/1527022_10201313263490136_120633134_n.jpg",
               @"timestamp" : @"March 28",
               @"postImage" : @"https://scontent-a-sjc.xx.fbcdn.net/hphotos-frc1/t1.0-9/734390_10201791527246431_964776558_n.jpg",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yF/r/WRXHiilIVpw.png",
               @"like": @"11 people like this."
               }
           ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.notificationTableView.dataSource = self;
    self.notificationTableView.delegate = self;
    self.notificationTableView.rowHeight = 95;
    
    UINib *nib = [UINib nibWithNibName:@"NotificationCell" bundle:nil];
    [self.notificationTableView registerNib:nib forCellReuseIdentifier:@"NotificationCell"];
    
    [self.notificationTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private table view methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    NSDictionary *notification = self.notifications[indexPath.row];
    cell.myText.text = notification[@"text"];
    cell.timeStamp.text = notification[@"timestamp"];
    
    NSURL *profileURL = [NSURL URLWithString:notification[@"profile_url"]];
    [cell.profileImage setImageWithURL:profileURL];
    NSURL *iconURL = [NSURL URLWithString:notification[@"iconURL"]];
    [cell.iconImage setImageWithURL:iconURL];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PostViewController *postVC = [[PostViewController alloc]init];
    postVC.title = @"Post";

    NSDictionary *notification = self.notifications[indexPath.row];
    NSURL *profileURL = [NSURL URLWithString:notification[@"profile_url"]];
    NSURL *imageURL = [NSURL URLWithString:notification[@"postImage"]];
    
    postVC.profileThumbnailURL = profileURL;
    postVC.postImageURL = imageURL;
    postVC.nameString = notification[@"name"];
    postVC.stampString = notification[@"timestamp"];
    postVC.likeString = notification[@"like"];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"button_upload"] style:UIBarButtonItemStylePlain target:nil action:nil];
    postVC.navigationItem.rightBarButtonItem = rightButton;
    [self.navigationController pushViewController:postVC animated:YES];
}

@end
