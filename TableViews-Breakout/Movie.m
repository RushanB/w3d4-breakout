//
//  Movie.m
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString*)title andGenre:(NSNumber*)genreId andSynopsis:(NSString*)synopsis andCover:(UIImage*)cover
{
    self = [super init];
    if (self) {
        _title = title;
        _genreId = genreId;
        _synopsis = synopsis;
        _cover = cover;
        _rating = @-1;
    }
    return self;
}

-(void)setRating:(NSNumber *)rating {
    rating = MIN(@5, rating);
    rating = MAX(@0,rating);
    _rating = rating;
}
@end
