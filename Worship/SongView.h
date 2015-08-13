//
//  SongView.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "db.h"

@interface SongView : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *songTableView;
    NSMutableArray *songTableContent;
}

+ (SongView *)sharedSongView;

- (UIView *) getView:(CGRect*)contentArea;
- (UITableView *) getTableView:(CGRect*)contentArea;
- (void) loadSong:(NSString*)fileName;

@end