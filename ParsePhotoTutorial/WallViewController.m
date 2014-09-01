//
//  WallViewController.m
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 8/31/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "WallViewController.h"
#import "WallCollectionViewCell.h"
#import <Parse/Parse.h>

@interface WallViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UIBarButtonItem *uploadButton;
@property (strong, nonatomic) UIBarButtonItem *logoutButton;
@property (strong, nonatomic) NSArray *wallObjectsArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) WallCollectionViewCell *wallCell;

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

-(void)viewWillAppear:(BOOL)animated {
    [self getWallImages];
}

-(void)segueToUploadVC {
    [self performSegueWithIdentifier:@"uploadSegue" sender:self];
}

-(void)logoutButtonPressed {
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:true];
}

-(void)getWallImages {
    PFQuery *query = [PFQuery queryWithClassName:@"WallImageObject"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.wallObjectsArray = nil;
            self.wallObjectsArray = [[NSArray alloc]initWithArray:objects];
            [self.collectionView reloadData];
        } else {
            NSString *errorString = [error.userInfo objectForKey:@"error"];
            [self errorAlertController:errorString];
        }
    }];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
    
    PFObject *wallObject = self.wallObjectsArray[indexPath.row];
    NSLog(@"%@", wallObject);
    
    PFFile *image = (PFFile *)[wallObject objectForKey:@"image"];
    cell.wallImageView.image = [UIImage imageWithData:image.getData];
    
    NSDate *date = wallObject.createdAt;
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    NSString *user = [wallObject objectForKey:@"user"];
    cell.wallUserInfoLabel.text = [NSString stringWithFormat:@"%@, %@", user, [df stringFromDate:date]];
    cell.wallCommentLabel.text = [wallObject objectForKey:@"comment"];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.wallObjectsArray.count;
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
