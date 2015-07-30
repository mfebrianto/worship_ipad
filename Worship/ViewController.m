//
//  ViewController.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import "ViewController.h"
#import "ExternalScreen.h"

@implementation ViewController

static ViewController *sharedViewCcontroller;

+ (ViewController *)sharedViewCcontroller {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedViewCcontroller = [[ViewController alloc] init];
    });
    return sharedViewCcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ExternalScreen  sharedES]; //calling singleton external screen
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
    
    ContentView *contentView = [[ContentView  alloc]init];
    [self.view addSubview:[contentView getView:&areaTwo]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
