//
//  ViewController.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import "ViewController.h"
#import "ExternalScreen.h"
#import "ScheduleView.h"

@implementation ViewController

static ViewController *sharedViewCcontroller;

+ (ViewController *)sharedViewCcontroller {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedViewCcontroller = [[ViewController alloc] init];
    });
    return sharedViewCcontroller;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ExternalScreen  sharedES]; //calling singleton external screen
    // Do any additional setup after loading the view, typically from a nib.
    [self loadDB];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect areaOne, areaTwo;
    CGRectDivide(self.view.bounds, &areaOne, &areaTwo, self.view.bounds.size.width * 0.30, CGRectMinXEdge);
    
    [self.view addSubview:[[ScheduleView sharedScheduleView] getTableView: &areaOne]];
    
    [self addChildViewController:[ContentView sharedContentView]];
    
    [self.view addSubview:[[ContentView sharedContentView] getView:&areaTwo]];
}

- (void) loadDB{
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.sql"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
