//
//  ButtonNewSong.m
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ButtonSaveSong.h"

@implementation ButtonSaveSong

static ButtonSaveSong *sharedButtonSaveSong;

+ (ButtonSaveSong *)sharedButtonSaveSong {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedButtonSaveSong = [[ButtonSaveSong alloc] init];
    });
    return sharedButtonSaveSong;
}


- (id) init
{
    if (!(self = [super init])) return self;
    
    
    return self;
}

- (UIButton *) getButton
{
    btn=[[UIButton alloc]initWithFrame:CGRectMake(500, 20, 150, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"Save Song" forState:UIControlStateNormal];
    
    //adding action programatically
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (IBAction)clicked:(id)sender
{
    NSString *title = [btn.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"closeSongEditor");
    [self closeSongEditor];
    
}

- (void)closeSongEditor //this method duplicated with the one in ButtonNewSong
{
    [[ContentView sharedContentView] removeView];
    [[ContentView sharedContentView] addSongTableView];
    [self renameButtonLabel:@"New Song"];
}

- (void)renameButtonLabel:(NSString*)label //this method duplicated with the one in ButtonNewSong
{
    [btn setTitle:label forState:UIControlStateNormal];
}

- (void)hide{
    NSLog(@"hide save song button");
    [btn setHidden:YES];
}

- (void)show{
    NSLog(@"show save song button");
    [btn setHidden:NO];
}



@end