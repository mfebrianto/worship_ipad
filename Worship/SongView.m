//
//  SongView.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongView.h"

@implementation SongView

- (id) init
{
    if (!(self = [super init])) return self;
    
    return self;
}

- (UIView *) getView:(CGRect*)contentArea
{
    songView = [[UIView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    songView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    songView.backgroundColor = [UIColor greenColor];
    songView.layer.borderWidth = 2.0;
    songView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    songView.layer.shadowOffset = CGSizeZero;
    songView.layer.shadowOpacity = 0.5;
        
    return songView;
}

- (UITableView *) getTableView:(CGRect*)contentArea
{
    songTableView = [[UITableView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    songTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    
    return songTableView;
}





@end
