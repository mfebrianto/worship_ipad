//
//  ContentView.h
//  Worship
//
//  Created by michael febrianto on 29/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongView.h"
#import "SongHeader.h"
#import "SongEditor.h"


@interface ContentView : UIViewController
{
    UIView *contentView;
    CGRect header, content;
}

+ (ContentView *)sharedContentView;

- (UIView *) getView:(CGRect*)areaTwo;
- (void) removeView;
- (void) addSongEditor;
- (void) addSongTableView;

@end