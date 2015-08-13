//
//  ButtonNewSong.h
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ContentView.h"
#import "SongView.h"
#import "SongEditor.h"
#import "ScheduleView.h"

@interface ButtonSaveSong : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIButton *btn;
}

+ (ButtonSaveSong *)sharedButtonSaveSong;

- (void)renameButtonLabel:(NSString*)label;

- (UIButton *)getButton;

- (IBAction)clicked:(id)sender;

- (void)hide;

- (void)show;


@end