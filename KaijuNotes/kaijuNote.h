//
//  kaijuNote.h
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface kaijuNote : NSObject

@property (strong, nonatomic) UIImage *kaijuImage;
@property (strong, nonatomic) NSString *kaijuTitle;
@property (strong, nonatomic) NSString *kaijuBio;

-(instancetype) initWithTitle:(NSString *) title withBody:(NSString *) body withPicture: (UIImage *) picture;


@end
