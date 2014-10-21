//
//  ViewNoteViewController.m
//  KaijuNotes
//
//  Created by System Administrator on 10/20/14.
//  Copyright (c) 2014 System Administrator. All rights reserved.
//

#import "ViewNoteViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewNoteViewController () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *kaijuImageView;

@property (weak, nonatomic) IBOutlet UILabel *kaijuTitle;

@property (weak, nonatomic) IBOutlet UITextView *kaijuBio;

@end

@implementation ViewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kaijuImageView.image = self.note.kaijuImage;
    self.kaijuBio.text = self.note.kaijuBio;
    self.kaijuTitle.text = self.note.kaijuTitle;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emailNote:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        
        NSString *messageSubject = self.note.kaijuTitle;
        NSString *messageBody = self.note.kaijuBio;
        
        NSData *imageData = UIImageJPEGRepresentation(self.note.kaijuImage, 1);
        [mailViewController addAttachmentData:imageData mimeType:@"image/jpeg" fileName:@"KaijuNoteImage.jpg"];
        
        [mailViewController setSubject:messageSubject];
        [mailViewController setMessageBody:messageBody isHTML:NO];
        
        [self.navigationController presentViewController:mailViewController animated:YES completion:nil];
        
    }
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
