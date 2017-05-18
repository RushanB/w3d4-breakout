//
//  MovieTableViewCell.h
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieTableViewCell : UITableViewCell
@property (strong,nonatomic) Movie *movie;
-(void)updateInfo;
@end
