//
//  LoginViewController.m
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 8/31/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginButtonPressed:(id)sender {
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"loginSuccessful" sender:self];
        } else {
            NSString *errorString = [error.userInfo objectForKey:@"error"];
            [self errorAlertController:errorString];
        }
    }];
}

-(void)errorAlertController:(NSString *)errorString {
    UIAlertController* errorAlertController = [UIAlertController alertControllerWithTitle:@"Error!" message:errorString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [errorAlertController addAction:cancelAction];
    
    [self presentViewController:errorAlertController animated:true completion:nil];
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
