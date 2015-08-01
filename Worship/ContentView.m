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
    
    CGRect header, content;
    CGRectDivide(contentView.bounds, &header, &content, contentView.bounds.size.height * 0.1, CGRectMinYEdge);

    SongHeader *songHeader = [[SongHeader  alloc]init];
    [contentView addSubview:[songHeader getView:&header]];
    
    SongView *songView = [[SongView  alloc]init];
    [self addChildViewController:songView];
    [contentView addSubview:[songView getTableView:&content]];

    
    return contentView;
}


@end

