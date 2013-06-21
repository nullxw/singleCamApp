//
//  ViewController.h
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomCameraViewController, PreviewPictureViewController;

@interface ViewController : UIViewController

@property (nonatomic, strong) CustomCameraViewController *customCameraViewController;
@property (nonatomic, strong) PreviewPictureViewController *previewPictureViewController;

- (IBAction)openCustomCamera:(id)sender;

@end
