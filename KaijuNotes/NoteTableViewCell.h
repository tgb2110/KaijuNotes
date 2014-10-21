//
//  NoteTableViewCell.h
//  KaijuNotes
//
//  Created by System Administrator on 10/19/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *smallCellImageView;
@property (weak, nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteSnippetLabel;

@end
