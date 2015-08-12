//
//  ScheduleView.m
//  Worship
//
//  Created by michael febrianto on 12/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ScheduleView.h"


@implementation ScheduleView

static ScheduleView *sharedScheduleView;

+ (ScheduleView *)sharedScheduleView {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedScheduleView = [[ScheduleView alloc] init];
    });
    return sharedScheduleView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UITableView *) getTableView:(CGRect*)contentArea{
    // init table view
    scheduleTableView = [[UITableView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    scheduleTableView.layer.borderWidth = 2.0;
    scheduleTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin;
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    scheduleTableView.delegate = self;
    scheduleTableView.dataSource = self;
    
    scheduleTableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    return scheduleTableView;
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void) allFiles
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //--- list all files in directory --//
    NSLog(@"LISTING ALL FILES FOUND");
    
    int count;
    
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    for (count = 0; count < (int)[directoryContent count]; count++)
    {
        NSLog(@"File %d: %@", (count + 1), [directoryContent objectAtIndex:count]);
    }
    
    //--- read file --//
//    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"textfile.txt"];
//    NSString *read_content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
//    NSLog(@"content %@", read_content);
//    
    //--- end---//
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    NSInteger row = [indexPath row];
    
    UITableViewCell *cell = [scheduleTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    
    switch (row)
    {
        case 0:
            cell.textLabel.text = @"There is nothing worth more";
            break;
        case 1:
            cell.textLabel.text = @"nothing can compare You are living hope";
            break;
        case 2:
            cell.textLabel.text = @"Your presence Lord";
            break;
        case 3:
            cell.textLabel.text = @"I tested and see of";
            break;
        default:
            cell.textLabel.text = @"sweetness of love";
            break;
            
    }
    
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
//- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *cellText = cell.textLabel.text;
//    NSLog(@"%@",cellText);
//    [[ExternalScreen  sharedES] updateText:cellText];
//}

@end
