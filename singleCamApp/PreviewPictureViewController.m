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
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSLog(@"screenRect: %f %f %f %f",
          screenRect.origin.x,
          screenRect.origin.y,
          screenRect.size.width,
          screenRect.size.height
          );
    
    NSLog(@"self: %f %f %f %f",
          self.view.frame.origin.x,
          self.view.frame.origin.y,
          self.view.frame.size.width,
          self.view.frame.size.height
          );
    
    // Set As FullScreen
    [self.view setFrame: screenRect];
    
    NSLog(@"self: %f %f %f %f",
          self.view.frame.origin.x,
          self.view.frame.origin.y,
          self.view.frame.size.width,
          self.view.frame.size.height
          );
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show" style:UIBarButtonItemStylePlain target:self action:@selector(cancelView:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)retakePicture:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIAlertDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Hide current view after clicked any button
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
