//
//  PostViewController.m
//  HomeWork5
//
//  Created by Kelly Xu on 4/5/14.
//  Copyright (c) 2014 iosbootcamp. All rights reserved.
//

#import "PostViewController.h"
#import "UIKit+AFNetworking.h"

@interface PostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileThumbnail;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

- (IBAction)onTap:(UITapGestureRecognizer *)sender;
@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.likeLabel.text = self.likeString;
    
    self.timeStamp.text = self.stampString;
    self.nameLabel.text = self.nameString;
    [self.profileThumbnail setImageWithURL:self.profileThumbnailURL];
    [self.postImage setImageWithURL:self.postImageURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
@end
