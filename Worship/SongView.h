//
//  SongView.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongView : NSObject
{
    UIView *songView;
    UITableView *songTableView;
}

- (UIView *) getView:(CGRect*)contentArea;
- (UITableView *) getTableView:(CGRect*)contentArea;

@end