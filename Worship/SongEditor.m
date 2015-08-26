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

- (UIView *) getView:(CGRect*)contentArea
{
    songContent = [[UIView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    songContent.autoresizingMask =  UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songContent.backgroundColor = [UIColor grayColor];

    CGRect areaTitle, areaSong;
    CGRectDivide(songContent.bounds, &areaTitle, &areaSong, songContent.bounds.size.height * 0.10, CGRectMinYEdge);

    songTitle = [[UITextField alloc] initWithFrame:CGRectInset(areaTitle, 10, 10)];
    songTitle.layer.cornerRadius=8.0f;
    songTitle.layer.masksToBounds=YES;
    songTitle.backgroundColor = [UIColor whiteColor];
    
    songEditor = [[UITextView alloc] initWithFrame:CGRectInset(areaSong, 10, 10)];
    songEditor.autoresizingMask =  UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songEditor.backgroundColor = [UIColor grayColor];
    
    [songContent addSubview: songTitle];
    [songContent addSubview: songEditor];
    
    return songContent;
}

- (NSString *) getSong
{
    return songEditor.text;
}

- (void) loadString:(NSString *)songs :(NSString *)title
{
    songTitle.text = title;
    songEditor.text = songs;
}


@end
