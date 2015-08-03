//
//  ButtonNewSong.h
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ButtonNewSong : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+ (ButtonNewSong *)sharedButtonNewSong;

- (UIButton *)getButton;

- (IBAction)clicked:(id)sender;



@end