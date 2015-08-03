//
//  ContentView.m
//  Worship
//
//  Created by michael febrianto on 29/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentView.h"

@implementation ContentView

static ContentView *sharedContentView;

+ (ContentView *)sharedContentView {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedContentView = [[ContentView alloc] init];
    });
    return sharedContentView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UIView *) getView:(CGRect*)contentArea
{
    contentView = [[UIView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    contentView.autoresizingMask =  UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    contentView.backgroundColor = [UIColor greenColor];
    contentView.layer.borderWidth = 2.0;
    contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    contentView.layer.shadowOffset = CGSizeZero;
    contentView.layer.shadowOpacity = 0.5;
    
    CGRectDivide(contentView.bounds, &header, &content, contentView.bounds.size.height * 0.1, CGRectMinYEdge);

    SongHeader *songHeader = [[SongHeader  alloc]init];
    [contentView addSubview:[songHeader getView:&header]];
    
    [self addChildViewController:[SongView sharedSongView]];
    [contentView addSubview:[[SongView sharedSongView] getTableView:&content]];
    
    return contentView;
}

- (void) removeView
{
    [contentView.subviews[1] removeFromSuperview];
}

- (void) addSongEditor
{
    [self addChildViewController:[SongEditor sharedSongEditor]];
    [contentView addSubview:[[SongEditor sharedSongEditor]getView:&content]];
}


@end

