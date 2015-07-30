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
    [[ViewController sharedViewCcontroller] clicked];

}


@end
