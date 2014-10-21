//
//  kaijuNote.m
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import "KaijuNote.h"

@implementation kaijuNote

- (instancetype)init
{
    return [self initWithTitle:@"" withBody:@"" withPicture:NULL];
}

-(instancetype)initWithTitle:(NSString *)title withBody:(NSString *)body withPicture:(UIImage *)picture {
   
    self = [super init];
    if (self) {
        _kaijuTitle = title;
        _kaijuBio = body;
        _kaijuImage = picture;
    }
    return self;
}

@end
