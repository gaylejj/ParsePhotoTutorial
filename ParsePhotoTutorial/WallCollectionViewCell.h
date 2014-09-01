//
//  WallCollectionViewCell.h
//  ParsePhotoTutorial
//
//  Created by Jeff Gayle on 9/1/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *wallImageView;
@property (weak, nonatomic) IBOutlet UILabel *wallUserInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *wallCommentLabel;

@end
