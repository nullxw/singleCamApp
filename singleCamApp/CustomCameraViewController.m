//
//  CustomCameraViewController.m
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import "CustomCameraViewController.h"
#import "PreviewPictureViewController.h"

@interface CustomCameraViewController ()

@end

@implementation CustomCameraViewController

@synthesize pickerController;
@synthesize btnHideCamera = _btnHideCamera;
@synthesize previewPictureViewController;

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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
    if(previewPictureViewController == nil){
        previewPictureViewController = [storyboard instantiateViewControllerWithIdentifier:@"PreviewPictureViewController"];
    }
    [previewPictureViewController setImagePicture:nil ];
    
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

-(IBAction)closeCameraView:(id)sender
{
    [pickerController dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)takePicture:(id)sender
{
    [pickerController takePicture];
    
} 

#pragma mark - When finish shoot

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get image from camera
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // But before here, we need to show other VC to See image and select what's next.
    [previewPictureViewController setImageSource:image];
    
    // Show PreviewPictureController
    [self presentViewController:previewPictureViewController animated:YES completion:^(void){
        
    }];
    
}

@end
