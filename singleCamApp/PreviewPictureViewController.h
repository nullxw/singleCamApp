//
//  PreviewPictureViewController.h
//  singleCamApp
//
//  Created by amayoral on 20/06/13.
//  Copyright (c) 2013 amayoral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewPictureViewController : UIViewController
{
    UIImage *imageSource;
}

@property (nonatomic, retain) IBOutlet UIImageView *imagePicture;
@property (nonatomic, retain) UIImage *imageSource;

-(IBAction)saveImageAction:(id)sender;
-(IBAction)cancelView:(id)sender;
-(IBAction)retakePicture:(id)sender;

@end
