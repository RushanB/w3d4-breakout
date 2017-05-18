//
//  Genre.h
//  TableViews-Breakout
//
//  Created by Kareem Sabri on 2017-05-18.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Genre : NSObject
@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *name;
- (instancetype)initWithId:(NSNumber*)id andName:(NSString*)name;
@end
