//
//  Movie.h
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Genre.h"

@interface Movie : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *synopsis;
@property (strong, nonatomic) NSNumber *rating;
@property (strong, nonatomic) UIImage *cover;
@property (strong, nonatomic) NSNumber *genreId;

- (instancetype)initWithTitle:(NSString*)title andGenre:(NSNumber*)genreId andSynopsis:(NSString*)synopsis andCover:(UIImage*)cover;

@end
