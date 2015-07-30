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
//    [btn addTarget:[ViewController  sharedViewCcontroller] action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    NSLog(@"btnClicked is called");
    //    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    //    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    ViewController *viewController = [[ViewController  alloc]init];
    //    imagePickerController.delegate = viewController;
    //    ViewController *viewController = [[ViewController  alloc]init];
    //    [self presentViewController:imagePickerController animated:YES completion:nil];
    
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
