//
//  AddNewNoteViewController.m
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import "AddNewNoteViewController.h"
#import "kaijuNoteDataStore.h"

@interface AddNewNoteViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *noteImageView;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@property (strong, nonatomic) kaijuNoteDataStore *dataStore;
- (IBAction)hideKeyboard:(id)sender;

- (IBAction)addPicture:(UIBarButtonItem *)sender;

- (IBAction)saveNote:(UIButton *)sender;

- (IBAction)titleEnded:(UITextField *)sender;

@end

@implementation AddNewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.noteImageView.image = [UIImage imageNamed:@"noPhotoStockImage.jpg"];
    
    self.dataStore = [kaijuNoteDataStore sharedKaijuNotesDataStore];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveNote:(UIButton *)sender {
    
    UIImage *kaijuPicture = self.noteImageView.image;
    
    NSString *title = self.titleTextField.text;
    NSString *body = self.bodyTextView.text;
    
    [self.dataStore createKaijuNoteWithTitle:title withBody:body withPicture:kaijuPicture];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)hideKeyboard:(id)sender {
    
    [self.titleTextField resignFirstResponder];
}

- (IBAction)addPicture:(UIBarButtonItem *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self.navigationController presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    UIImage *kaijuPicture = [UIImage imageNamed:@"kaijuStockImage.jpg"];
    self.noteImageView.image = kaijuPicture;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end
