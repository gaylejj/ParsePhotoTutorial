//
//  UploadViewController.m
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 9/1/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "UploadViewController.h"
#import <Parse/Parse.h>

@interface UploadViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *uploadImageView;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)selectPicturePressed:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self.navigationController presentViewController:imagePicker animated:true completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:true completion:nil];
    self.uploadImageView.image = info[UIImagePickerControllerOriginalImage];
}

- (IBAction)sendPicturePressed:(id)sender {
    [self.uploadImageView resignFirstResponder];
    
    NSData *pictureData = UIImagePNGRepresentation(self.uploadImageView.image);
    
    PFFile *image = [PFFile fileWithName:@"pic" data:pictureData];
    
    [image saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            PFObject *wallImageObject = [PFObject objectWithClassName:@"WallImageObject"];
            [wallImageObject setObject:image forKey:@"image"];
            [wallImageObject setObject:[PFUser currentUser] forKey:@"user"];
            [wallImageObject setObject:self.commentTextField.text forKey:@"comment"];
            
            [wallImageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [self.navigationController popViewControllerAnimated:true];
                } else {
                    NSString *errorString = [error.userInfo objectForKey:@"error"];
                    [self errorAlertController:errorString];
                }
            }];
        } else {
            NSString *errorString = [error.userInfo objectForKey:@"error"];
            [self errorAlertController:errorString];
        }
    } progressBlock:^(int percentDone) {
        NSLog(@"%d", percentDone);
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
