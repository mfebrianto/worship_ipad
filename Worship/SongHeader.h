//
//  SongView.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ButtonChangeBackground.h"
#import "ButtonNewSong.h"
#import "ButtonSaveSong.h"

@interface SongHeader : NSObject
{
    UIView *songHeader;
}

- (UIView *) getView:(CGRect*)headerArea;

@end