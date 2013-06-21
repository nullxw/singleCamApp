//
//  ViewController.m
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import "ViewController.h"
#import "CustomCameraViewController.h"
#import "PreviewPictureViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImagePickerController *tmpPickerController;
    CGRect screenRect;
    UIStoryboard *storyboard;
}

@synthesize customCameraViewController, previewPictureViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Init picker
    tmpPickerController = [[UIImagePickerController alloc]init];
    
    screenRect = [[UIScreen mainScreen] bounds];
    
    storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
    
    if(nil == customCameraViewController){
        customCameraViewController = (CustomCameraViewController*)[storyboard instantiateViewControllerWithIdentifier:@"CustomCameraViewController"];
    }
    if(nil == previewPictureViewController){
        previewPictureViewController = (PreviewPictureViewController*)[storyboard instantiateViewControllerWithIdentifier:@"PreviewPictureViewController"];
    }
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showPreviewPictureViewController:)
                                                 name:@"SHOW_PREVIEW_PICTURE"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(retakePicture:)
                                                 name:@"RETAKE_PICTURE"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(closeCameraAndPreview:)
                                                 name:@"CLOSE_CAMERA_AND_PREVIEW"
                                               object:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openCustomCamera:(id)sender
{
    [self cameraDidLoad];
}
- (void)showPreviewPictureViewController:(NSNotification*)notification
{    
    if(notification)
    {
        NSDictionary* infoToObject = [notification userInfo];
        UIImage *image = (UIImage *)[infoToObject valueForKey:@"uiimage"];
        
        // Set images values before next VC are loaded.
        [previewPictureViewController setImageSource:image];
        [previewPictureViewController.imagePicture setImage:image];
        
        // Show Preview View
        [self previewPictureDidLoad];
    }
    
}
- (void)retakePicture:(NSNotification*)notification
{
    
    if(notification)
    {
        //NSDictionary* infoToObject = [notification userInfo];
        //UIImage *image = (UIImage *)[infoToObject valueForKey:@"uiimage"];
        
        // Set images values before next VC are loaded.
        [previewPictureViewController setImageSource:nil];
        [previewPictureViewController.imagePicture setImage:nil];
        
        // Hide PreviewPictureController after show next view
        [previewPictureViewController dismissViewControllerAnimated:NO completion:^(void){
            // Show Camera View
            [self presentViewController:customCameraViewController.pickerController animated:YES completion:nil];
        }];
    }
    
}

- (void)closeCameraAndPreview:(NSNotification*)notification
{
    
    if(notification)
    {
        //NSDictionary* infoToObject = [notification userInfo];
        //UIImage *image = (UIImage *)[infoToObject valueForKey:@"uiimage"];
        
        // Set images values before next VC are loaded.
        [previewPictureViewController setImageSource:nil];
        [previewPictureViewController.imagePicture setImage:nil];
        
        // Hide PreviewPictureController after show next view
        [previewPictureViewController dismissViewControllerAnimated:NO completion:^(void){
            // Hide Camera View
            [customCameraViewController.pickerController dismissViewControllerAnimated:YES completion:nil];
            customCameraViewController.pickerController = nil;
        }];
    }
    
}

- (void)previewPictureDidLoad
{
    // Hide Camera View after show next view
    [customCameraViewController.pickerController dismissViewControllerAnimated:NO completion:^(void){
        // Show PreviewPictureController
        [self presentViewController:previewPictureViewController animated:YES completion:nil];
    }];
}

- (void)cameraDidLoad
{
    
    [customCameraViewController setPickerController: tmpPickerController ];
    [customCameraViewController.pickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    [customCameraViewController.pickerController setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [customCameraViewController.pickerController setCameraFlashMode:UIImagePickerControllerCameraFlashModeAuto];
    [customCameraViewController.pickerController setDelegate:customCameraViewController.self];
    [customCameraViewController.pickerController setAllowsEditing:NO];
    [customCameraViewController.pickerController setShowsCameraControls:NO];
    [customCameraViewController.pickerController setWantsFullScreenLayout:YES];
    
    [customCameraViewController.view setBackgroundColor:[UIColor clearColor]];
    customCameraViewController.pickerController.view.frame =
    CGRectMake(
               0,
               0,
               screenRect.size.width,
               screenRect.size.height-100
               );
    
    
    
    // Assign custom view from other controller.
    [customCameraViewController.pickerController setCameraOverlayView: customCameraViewController.view];
    
    [self presentViewController:customCameraViewController.pickerController animated:YES completion:^(void){
    }];
}

- (void)previewPictureDidUnLoad
{
    [previewPictureViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidUnload
{
    [customCameraViewController.pickerController dismissViewControllerAnimated:YES completion:NO];
}

@end
