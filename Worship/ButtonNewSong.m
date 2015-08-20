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
    btn=[[UIButton alloc]initWithFrame:CGRectMake(300, 20, 150, 30)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"New Song" forState:UIControlStateNormal];
    
    //adding action programatically
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (IBAction)clicked:(id)sender
{
    NSString *title = [btn.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([title isEqualToString: @"NewSong"]){
        NSLog(@"openSongEditor");
        [self openSongEditor];
    }
    else{
        NSLog(@"closeSongEditor");
        [self closeSongEditor];
    }

    
}

- (void) openEditSong:(NSString *)songTitle
{
    [self renameButtonLabel:@"cancel"];
    [self showSongContent:@"Update Song"];
    Db *db = [[Db alloc]init];
    [[SongEditor sharedSongEditor] loadString:[db getFile:songTitle]];
}


- (void)openSongEditor
{
    [self renameButtonLabel:@"cancel"];
    [self showSongContent:@"Save Song"];
}

- (void)showSongContent:(NSString*)label
{
    [[ContentView sharedContentView] removeView];
    [[ContentView sharedContentView] addSongEditor];
    [[ButtonSaveSong  sharedButtonSaveSong] renameButtonLabel:label];
    [[ButtonSaveSong  sharedButtonSaveSong] show];
}

- (void)closeSongEditor
{
    [[ContentView sharedContentView] removeView];
    [[ContentView sharedContentView] addSongTableView];
    [[ButtonSaveSong  sharedButtonSaveSong] hide];
    [[ScheduleView sharedScheduleView] reloadData];
    [self renameButtonLabel:@"New Song"];
}

- (void)renameButtonLabel:(NSString*)label
{
    [btn setTitle:label forState:UIControlStateNormal];
}


@end