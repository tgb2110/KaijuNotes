//
//  kaijuNoteDataStore.h
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface kaijuNoteDataStore : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableArray *kaijuNoteArray;

+ (instancetype) sharedKaijuNotesDataStore;

-(void) createKaijuNoteWithTitle:(NSString *) title withBody:(NSString *) body withPicture: (UIImage *) picture;


@end
