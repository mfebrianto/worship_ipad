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

- (ButtonChangeBackground *) init
{
    if (!(self = [super init])) return self;

    ButtonChangeBackground *btn=[[ButtonChangeBackground alloc]initWithFrame:CGRectMake(50, 20, 30, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    
    //adding action programatically
    [btn addTarget:[ViewController  sharedViewCcontroller] action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    return btn;
}

@end
