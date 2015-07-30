//
//  ButtonChangeBackground.h
//  Worship
//
//  Created by michael febrianto on 30/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ButtonChangeBackground : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+ (ButtonChangeBackground *)sharedButtonChangeBackground;

- (UIButton *)getButton;

- (IBAction)clicked:(id)sender;



@end