//
//  NewsfeedViewController.m
//  HomeWork5
//
//  Created by Kelly Xu on 4/5/14.
//  Copyright (c) 2014 iosbootcamp. All rights reserved.
//

#import "NewsfeedViewController.h"

@interface NewsfeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation NewsfeedViewController

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
    self.scrollView.contentSize = CGSizeMake(320, 2100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
