//
//  SongView.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongHeader.h"

#define SCREEN_CONNECTED	([UIScreen screens].count > 1)

@implementation SongHeader

- (id) init
{
    if (!(self = [super init])) return self;
    
    return self;
}

- (UIView *) getView:(CGRect*)headerArea
{
    songHeader = [[UIView alloc] initWithFrame:CGRectInset(*headerArea, 10, 10)];
    songHeader.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songHeader.backgroundColor = [UIColor redColor];
    songHeader.layer.borderWidth = 2.0;
    songHeader.layer.borderColor = [UIColor redColor].CGColor;
    songHeader.layer.shadowOffset = CGSizeZero;
    songHeader.layer.shadowOpacity = 0.5;
    
//    [songHeader addSubview:btn];
    
    return songHeader;
}





@end
