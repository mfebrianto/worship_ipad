//
//  ScheduleView.h
//  Worship
//
//  Created by michael febrianto on 12/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongView.h"

@interface ScheduleView : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *scheduleTableView;
}

+ (ScheduleView *)sharedScheduleView;

- (UITableView *) getTableView:(CGRect*)contentArea;
- (void) reloadData;

@end