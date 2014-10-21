//
//  MainTableViewController.m
//  KaijuNotes
//
//  Created by System Administrator on 10/19/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import "MainTableViewController.h"
#import "ViewNoteViewController.h"
#import "NoteTableViewCell.h"
#import "kaijuNoteDataStore.h"
#import "KaijuNote.h"

@interface MainTableViewController ()

@property (strong, nonatomic) kaijuNoteDataStore *dataStore;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataStore = [kaijuNoteDataStore sharedKaijuNotesDataStore];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dataStore.kaijuNoteArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kaijuCell" forIndexPath:indexPath];
    
    
    NSLog(@"%ld", indexPath.row);
    
    kaijuNote *noteToDisplay = [self.dataStore.kaijuNoteArray objectAtIndex:indexPath.row];
    
    cell.smallCellImageView.image = noteToDisplay.kaijuImage;
    cell.noteTitleLabel.text = noteToDisplay.kaijuTitle;
    cell.noteSnippetLabel.text = noteToDisplay.kaijuBio;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return YES - we will be able to delete all rows
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataStore.kaijuNoteArray removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"viewNoteSegue"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewNoteViewController *newVC = segue.destinationViewController;
        kaijuNote *selectedNote = [self.dataStore.kaijuNoteArray objectAtIndex:indexPath.row];
        newVC.note = selectedNote;
    }
}


@end
