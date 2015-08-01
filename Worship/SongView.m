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

@implementation SongView {
    UITableView *tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UITableView *) getTableView:(CGRect*)contentArea{
    // init table view
    tableView = [[UITableView alloc] initWithFrame:CGRectInset(*contentArea, 10, 10)];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    return tableView;
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

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    NSInteger row = [indexPath row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
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
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    NSLog(@"%@",cellText);
    [[ExternalScreen  sharedES] updateText:cellText];
}

@end