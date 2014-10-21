//
//  kaijuNoteDataStore.m
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import "kaijuNoteDataStore.h"
#import "kaijuNote.h"

@implementation kaijuNoteDataStore

+ (instancetype)sharedKaijuNotesDataStore {
    static kaijuNoteDataStore *_sharedKaijuNotesDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedKaijuNotesDataStore = [[kaijuNoteDataStore alloc] init];
    });
    
    return _sharedKaijuNotesDataStore;
}

+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _kaijuNoteArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)createKaijuNoteWithTitle:(NSString *)title withBody:(NSString *)body withPicture:(UIImage *)picture {
    
    kaijuNote *newNote = [[kaijuNote alloc] initWithTitle:title withBody:body withPicture:picture];
    
    [self.kaijuNoteArray addObject:newNote];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    kaijuNoteDataStore *instance = [kaijuNoteDataStore sharedKaijuNotesDataStore];
    instance.kaijuNoteArray = [decoder decodeObjectForKey:@"kaijuNoteArray"];
    // _kaijuNoteArray = [[NSMutableArray alloc] init];
    return instance;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.kaijuNoteArray forKey:@"kaijuNoteArray"];
}


@end
