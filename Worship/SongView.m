//
//  SongView.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongView.h"

#define SCREEN_CONNECTED	([UIScreen screens].count > 1)

@implementation SongView

- (id) init
{
    if (!(self = [super init])) return self;
    
    return self;
}

- (UIView *) getView:(CGRect*)contentArea :(UIButton*) btn;
{
    songView = [[UIView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    songView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songView.backgroundColor = [UIColor greenColor];
    songView.layer.borderWidth = 2.0;
    songView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    songView.layer.shadowOffset = CGSizeZero;
    songView.layer.shadowOpacity = 0.5;
    
    [songView addSubview:btn];
    
    return songView;
}





@end
