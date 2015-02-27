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
@property (weak, nonatomic) IBOutlet UITextField *postTextField;

- (IBAction)onTap:(UITapGestureRecognizer *)sender;
@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardDidShowNotification object:nil];
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
    self.postTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"begin typing");
}


- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

-(void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    
    NSLog(@"keyboardFrame: %@", NSStringFromCGRect(keyboardFrame));
}

@end
