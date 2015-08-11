//
//  SongEditor.m
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongEditor.h"

@implementation SongEditor

static SongEditor *sharedSongEditor;

+ (SongEditor *)sharedSongEditor {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSongEditor = [[SongEditor alloc] init];
    });
    return sharedSongEditor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UITextView *) getView:(CGRect*)contentArea
{
    songEditor = [[UITextView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    songEditor.autoresizingMask =  UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songEditor.backgroundColor = [UIColor grayColor];
    
    return songEditor;
}

- (NSString *) getSong
{
    return songEditor.text;
}

@end
