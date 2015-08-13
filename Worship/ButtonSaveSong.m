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
    NSLog(@"save song button clicked");
    [self closeSongEditor];
    [self writeToText];
    [self hide];
    [[ButtonNewSong sharedButtonNewSong] closeSongEditor];
}

- (NSString *) getTitle:(NSString*)song
{
    NSString *title = @"textfile_";
    title = [title stringByAppendingFormat:@"%@.txt", song];
    NSLog(@">>>>>title>>>>>>%@", title);
    return title;
}

- (void) writeToText
{
    NSString *content = [[SongEditor sharedSongEditor] getSong];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    
    NSLog(@">>>>>number of files before save>>>>>>%d", [directoryContent count]);
    
    NSString *index = [NSString stringWithFormat:@"%d", [directoryContent count]+1];
    
    
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",
                      documentsDirectory, [self getTitle:index]];

    [content writeToFile:fileName
          atomically:NO
            encoding:NSStringEncodingConversionAllowLossy
               error:nil];
    
    
    directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    
    NSLog(@">>>>>number of files after save>>>>>>%d", [directoryContent count]);

    

    
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