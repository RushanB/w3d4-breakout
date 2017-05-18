//
//  DetailViewController.m
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "DetailViewController.h"
#import "Movie.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailViewController

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    [self setInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInfo];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setInfo];
}

- (void)setInfo {
    self.title = self.movie.title;
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;
    self.coverImageView.image = self.movie.cover;
}

@end
