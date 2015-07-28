//
//  ViewController.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import "ViewController.h"
#import "ExternalScreen.h"
#import "SongView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    es = [[ExternalScreen  alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect areaOne, areaTwo;
    CGRectDivide(self.view.bounds, &areaOne, &areaTwo, self.view.bounds.size.width * 0.30, CGRectMinXEdge);
    
    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectInset(areaOne, 10, 10)];
    viewOne.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin;
    viewOne.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    viewOne.layer.borderWidth = 2.0;
    viewOne.layer.borderColor = [UIColor lightGrayColor].CGColor;
    viewOne.layer.shadowOffset = CGSizeZero;
    viewOne.layer.shadowOpacity = 0.5;
    [self.view addSubview:viewOne];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(50, 20, 30, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    //adding action programatically
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    SongView *songView = [[SongView  alloc]init];
    [self.view addSubview:[songView getView:&areaTwo :btn]];
    
    
}

- (IBAction)btnClicked:(id)sender
{
    NSLog(@"btnClicked is called");
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    //Or you can get the image url from AssetsLibrary
    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    [es changeBackgroundImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
