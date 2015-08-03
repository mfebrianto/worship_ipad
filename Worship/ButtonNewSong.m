//
//  ButtonNewSong.m
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ButtonNewSong.h"

@implementation ButtonNewSong

static ButtonNewSong *sharedButtonNewSong;

+ (ButtonNewSong *)sharedButtonNewSong {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedButtonNewSong = [[ButtonNewSong alloc] init];
    });
    return sharedButtonNewSong;
}


- (id) init
{
    if (!(self = [super init])) return self;
    
    
    return self;
}

- (UIButton *) getButton
{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(300, 20, 200, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"New Song" forState:UIControlStateNormal];
    
    //adding action programatically
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (IBAction)clicked:(id)sender
{
    NSLog(@"button new song clicked");
    [self clicked];
    
}

- (void)clicked
{
    NSLog(@"clicked");
    [[ContentView sharedContentView] removeView];
}

@end