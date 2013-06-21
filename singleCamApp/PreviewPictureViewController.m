//
//  PreviewPictureViewController.m
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import "PreviewPictureViewController.h"

@interface PreviewPictureViewController ()

@end

@implementation PreviewPictureViewController

@synthesize imageSource, imagePicture;

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
    
    [imagePicture setImage:imageSource];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show" style:UIBarButtonItemStylePlain target:self action:@selector(cancelView:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //imageSource = nil;
    //[imagePicture setImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Save photo

-(IBAction)saveImageAction:(id)sender
{
    UIImage *image = imageSource;
    if(nil != image )
    {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Image"
                                                    message:@"Image was saved!"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)cancelView:(id)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    // Launch notificaion center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CLOSE_CAMERA_AND_PREVIEW" object:nil userInfo:nil];
}

-(IBAction)retakePicture:(id)sender
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    // Launch notificaion center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RETAKE_PICTURE" object:nil userInfo:nil];
}

#pragma mark - UIAlertDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //[self dismissViewControllerAnimated:YES completion:nil];
    // Launch notificaion center
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CLOSE_CAMERA_AND_PREVIEW" object:nil userInfo:nil];
}

@end
