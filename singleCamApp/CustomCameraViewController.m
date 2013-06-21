//
//  CustomCameraViewController.m
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import "CustomCameraViewController.h"

@interface CustomCameraViewController ()

@end

@implementation CustomCameraViewController

@synthesize pickerController;
@synthesize btnHideCamera = _btnHideCamera;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeCameraView:(id)sender
{
    [pickerController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePicture:(id)sender
{
    [pickerController takePicture];
}

- (IBAction)configureFlash:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Flash"
                                                    message:@"Configure your own flash type (Auto/Off/On)!"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)configureCameraDevice:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera device"
                                                    message:@"Configure your own camera device (Rear/Front)"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - When finish shoot

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get image from camera
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    NSDictionary *infoToObject = [NSDictionary dictionaryWithObjectsAndKeys:image, @"uiimage", nil];
    
    // Launch notificaion center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHOW_PREVIEW_PICTURE" object:nil userInfo:infoToObject];
    
}

@end
