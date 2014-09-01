//
//  WallViewController.m
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 8/31/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "WallViewController.h"
#import <Parse/Parse.h>

@interface WallViewController ()

@property (strong, nonatomic) UIBarButtonItem *uploadButton;
@property (strong, nonatomic) UIBarButtonItem *logoutButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation WallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.uploadButton = [[UIBarButtonItem alloc]initWithTitle:@"Upload" style:UIBarButtonItemStylePlain target:self action:@selector(segueToUploadVC)];
    self.navigationItem.rightBarButtonItem = self.uploadButton;
    
    self.logoutButton = [[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logoutButtonPressed)];
    self.navigationItem.leftBarButtonItem = self.logoutButton;
    
    // Do any additional setup after loading the view.
}

-(void)segueToUploadVC {
    [self performSegueWithIdentifier:@"uploadSegue" sender:self];
}

-(void)logoutButtonPressed {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
