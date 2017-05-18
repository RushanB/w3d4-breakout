//
//  MovieTableViewCell.m
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "MovieTableViewCell.h"

@interface MovieTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@end

@implementation MovieTableViewCell

-(void)updateInfo {
    self.coverImageView.image = self.movie.cover;
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;
    if ([self.movie.rating intValue] < 0) {
        self.ratingLabel.text = @"Not yet rated";
    } else {
        self.ratingLabel.text = [NSString stringWithFormat:@"%@ Stars", self.movie.rating];
    }
}


@end
