//
//  Genre.m
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "Genre.h"

@implementation Genre
- (instancetype)initWithId:(NSNumber*)id andName:(NSString*)name;
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
@end
