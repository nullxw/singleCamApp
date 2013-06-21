//
//  CustomCameraViewController.h
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *pickerController;
}

@property (nonatomic, retain) IBOutlet UIImagePickerController *pickerController;
@property (nonatomic, retain) IBOutlet UIButton *btnHideCamera;


- (IBAction)closeCameraView:(id)sender;
- (IBAction)takePicture:(id)sender;
- (IBAction)configureFlash:(id)sender;
- (IBAction)configureCameraDevice:(id)sender;

@end
