//
//  ViewController.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalScreen.h"

@interface ViewController : UIViewController
{
    ExternalScreen * es;
}

@property (weak, nonatomic) IBOutlet UIButton *changeColourButton;


- (IBAction)callVideoKit:(id)sender;

@end

