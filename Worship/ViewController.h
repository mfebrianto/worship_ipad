//
//  ViewController.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalScreen.h"
#import "ContentView.h"
#import "DBManager.h"

@interface ViewController : UIViewController
{
    int screenWidth;
}

@property (nonatomic, strong) DBManager *dbManager;

+ (ViewController *)sharedViewCcontroller;

@end

