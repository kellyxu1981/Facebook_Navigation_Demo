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
              @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p111x111/10297697_10101616681798526_6267197803460763704_n.jpg?oh=f1626ab9670b521e9e9373364064f235&oe=558DADB6&__gda__=1435466023_1f661266cd9282958276077795e75465",
              @"timestamp" : @"6 hours ago",
              @"postImage" : @"https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-xfp1/v/t1.0-9/10984625_10152577308927085_5706791847532084966_n.jpg?oh=c6bee26adca02a2dc2c03dbe8d1d6f30&oe=558B48D4&__gda__=1434608305_7bee26439ded8d2062723a741e1acd6e",
              @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yT/r/L_gR5FtR_ZM.png",
               @"like": @"2 people like this."
              },
           @{  @"name" : @"Jon Martin",
               @"text" : @"Jon Martin posted in Zynga Alums:\"tap tap is this thing on. Here is a link. K byeeeee\"",
              @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p111x111/10355007_10204559063878749_4727683221809169905_n.jpg?oh=13b4954f7a638b6e1b50158a358147a7&oe=55817E28&__gda__=1434135632_343a4a85cb0be2b712b0649289855a69",
              @"timestamp" : @"Yesterday at 10:55PM",
              @"postImage" : @"https://scontent-sjc.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/1908293_10100538171581859_3317550882518168654_n.jpg?oh=1f450c64a6bcad643ecd8f5437900650&oe=554F3AD5",
              @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/EXllo1TL4MS.png",
               @"like": @"10 people like this."
              },
           @{  @"name" : @"Mike Katzourin",
               @"text" : @"Mike Katzourin updated his status:\"My birthday today!\"",
              @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/c0.89.649.649/s111x111/1800448_10205020223847446_3960797603759852427_n.jpg?oh=502f85333033936262aed5d535982cc9&oe=55821302&__gda__=1435758962_aa13d9e8ef0db7d57b38606ad2fe9f40",
              @"timestamp" : @"Yesterday at 11:20AM",
              @"postImage" : @"https://scontent-sjc.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/10330272_10100536575395629_144391107485750678_n.jpg?oh=14a91b7416bfbc38929cbd78e7949b4d&oe=557C7E5E",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yF/r/WRXHiilIVpw.png",
               @"like": @"5 people like this."
              },
           @{  @"name" : @"Laura Lee",
               @"text" : @"Cake of the day! Itching to go traveling...",
               @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/c0.22.111.111/p111x111/10614350_10152819094036133_7602420942893544369_n.jpg?oh=dcda77e926ff30e465ac29d24525fd3b&oe=558C3B50&__gda__=1435850427_1fe08a9fb169e261e301e7743eb7dd50",
               @"timestamp" : @"2 days ago",
               @"postImage" : @"https://scontent-sjc.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/11012788_10100532676249549_7858720259258325207_n.jpg?oh=0fecf90fd9ba2627a7c68014e435f3f8&oe=554D7FF0",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yT/r/L_gR5FtR_ZM.png",
               @"like": @"4 people like this."
               },
           @{  @"name" : @"Emily Lin",
               @"text" : @"Uploaded a new baby's picture, check it out",
               @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/v/t1.0-1/c30.30.377.377/s111x111/425686_340468829324356_2108383465_n.jpg?oh=33690235813cfc4dd5c04e7040967fe1&oe=5593978B&__gda__=1435185763_d6fc338f5be782f7f924f488caf182a3",
               @"timestamp" : @"April 4",
               @"postImage" : @"https://scontent-sjc.xx.fbcdn.net/hphotos-frc3/v/t1.0-9/10955244_10100525576562379_3295417733494926650_n.jpg?oh=a9163c3b43e06069e3144173c4d16d03&oe=557BC735",
               @"iconURL": @"https://fbstatic-a.akamaihd.net/rsrc.php/v2/y9/r/EXllo1TL4MS.png",
               @"like": @"18 people like this."
               },
           @{  @"name" : @"Craig Woida",
               @"text" : @"We'll miss you, Matt Levine. — with Matt Levine, Sevvanthie Sachithanandan, Roger Crain, Arvin Bautista, Brian Steffel, Jesse Hernandez and Jollan Seo.",
               @"profile_url" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p111x111/1472909_10153061375741358_2274097772159918472_n.jpg?oh=3814fb26aee58652bb348c412f3d6fa4&oe=557B7D69&__gda__=1434657643_52b1f07522b432e9203fb224da73bad2",
               @"timestamp" : @"March 28",
               @"postImage" : @"https://scontent-sjc.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/10404267_10100516678728709_6976536515203310287_n.jpg?oh=141c1756e5a79837464d4b1a665ce1d5&oe=557BAA83",
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
