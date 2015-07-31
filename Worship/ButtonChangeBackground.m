//
//  ButtonChangeBackground.m
//  Worship
//
//  Created by michael febrianto on 30/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ButtonChangeBackground.h"
#import "ExternalScreen.h"

@implementation ButtonChangeBackground

static ButtonChangeBackground *sharedButtonChangeBackground;

+ (ButtonChangeBackground *)sharedButtonChangeBackground {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedButtonChangeBackground = [[ButtonChangeBackground alloc] init];
    });
    return sharedButtonChangeBackground;
}


- (id) init
{
    if (!(self = [super init])) return self;

    
    return self;
}

- (UIButton *) getButton
{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(50, 20, 200, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"Background" forState:UIControlStateNormal];
    
    //adding action programatically
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (IBAction)clicked:(id)sender
{
    NSLog(@"button clicked");
    [self clicked];

}

- (void)clicked
{
    NSLog(@"clicked");
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    imagePickerController.modalPresentationStyle = UIModalPresentationFormSheet;
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    //Or you can get the image url from AssetsLibrary
    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    [[ExternalScreen  sharedES] changeBackgroundImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}



@end
