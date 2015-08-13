//
//  SongView.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongView.h"
#import "ExternalScreen.h"

@implementation SongView

static SongView *sharedSongView;

+ (SongView *)sharedSongView {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSongView = [[SongView alloc] init];
    });
    return sharedSongView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UITableView *) getTableView:(CGRect*)contentArea{
    // init table view
    songTableView = [[UITableView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    songTableView.delegate = self;
    songTableView.dataSource = self;
    
    songTableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    return songTableView;
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
    NSLog(@">>numberOfRowsInSection>>>>%d",[songTableContent count]);
    return [songTableContent count];
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    NSInteger row = [indexPath row];
    
    UITableViewCell *cell = [songTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:10.0];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // Pre-iOS6 use UILineBreakModeWordWrap
        cell.textLabel.numberOfLines = 2;  // 0 means no max.

    
    NSLog(@">>>>>>%d",[songTableContent count]);
    
    for (int index=0; index<[songTableContent count]; index++)
    {
        //Statements here
        if (row == index){
            cell.textLabel.text = [songTableContent objectAtIndex:index];
        }
    }
    

    return cell;

}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [songTableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    NSLog(@"%@",cellText);
    [[ExternalScreen  sharedES] updateText:cellText];
}

- (void)loadSong:(NSString*)fileName
{
    NSLog(@"try create db");
    Db *db = [[Db alloc] init];
    NSLog(@"db created");
    NSString *content = [db getFile:fileName];
    
    
    
    [songTableContent removeAllObjects];
    songTableContent = [[NSMutableArray alloc]initWithArray:[self parseSong:content]];
    NSLog(@">>>>loadSong>>>>%@", [songTableContent objectAtIndex:0]);
    [songTableView reloadData];
}

- (NSArray*)parseSong:(NSString*)song
{
    NSArray *arrSecond = [song componentsSeparatedByString:@"\n\n"];
    
    for(int i =0;i<[arrSecond count];i++){
        NSLog(@"Row %d: %@",i,[arrSecond objectAtIndex:i]);
    }
    
    return arrSecond;
}

@end