//
//  ViewController.m
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import "ViewController.h"
#import "CustomCameraViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImagePickerController *tmpPickerController;
}

@synthesize customCameraViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Init picker
    tmpPickerController = [[UIImagePickerController alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openCustomCamera:(id)sender
{
 
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
    if(nil == customCameraViewController)
    {
        customCameraViewController = (CustomCameraViewController*)[storyboard instantiateViewControllerWithIdentifier:@"CustomCameraViewController"];
    }
    
    
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

@end
