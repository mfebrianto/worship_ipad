//
//  SongEditor.h
//  Worship
//
//  Created by michael febrianto on 3/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SongEditor : UIViewController
{
    UITextView *songEditor;
    UIView *songContent;
    UITextField *songTitle;
}

+ (SongEditor *)sharedSongEditor;

- (UIView *) getView:(CGRect*)contentArea;

- (NSString *) getSong;
- (void) loadString:(NSString *)songs :(NSString *)title;

@end