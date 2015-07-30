//
//  ExternalScreen.m
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalScreen.h"

#define SCREEN_CONNECTED	([UIScreen screens].count > 1)

@implementation ExternalScreen

static ExternalScreen *sharedES;

+ (ExternalScreen *)sharedES
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedES = [[ExternalScreen alloc] init];
    });
    return sharedES	;
}

- (void) changeBackgroundImage:(UIImage*)imageBackground
{
    NSLog(@"changeBackgroundImage");
    backgoundImage = imageBackground;
    [backgroundColorWhite setImage:backgoundImage];
}

- (void) screenDidConnect: (NSNotification *) notification
{
    NSLog(@"Screen connected");
    UIScreen *screen = [[UIScreen screens] lastObject];
    
    if (_displayLink)
    {
        [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        [_displayLink invalidate];
        self.displayLink = nil;
    }
    
    self.displayLink = [screen displayLinkWithTarget:self selector:@selector(updateScreen)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    NSLog(@"Screen did connect done");
}

- (void) updateScreen
{
    //    NSLog(@"update screen");
    // Abort if the screen has been disconnected
    if (!SCREEN_CONNECTED && _outputWindow)
        self.outputWindow = nil;
    
    // (Re)initialize if there's no output window
    if (SCREEN_CONNECTED && !_outputWindow)
        [self setupExternalScreen];
    
    // Go ahead and update
    //        SAFE_PERFORM_WITH_ARG(_delegate, @selector(updateExternalView:), baseView);
    //    NSLog(@"update screen done");
}

- (void) setupExternalScreen
{
    NSLog(@"setup external screen");
    // Check for missing screen
    if (!SCREEN_CONNECTED) return;
    
    // Set up external screen
    UIScreen *secondaryScreen = [UIScreen screens][1];
    UIScreenMode *screenMode = [[secondaryScreen availableModes] lastObject];
    CGRect rect = (CGRect){.size = screenMode.size};
    //    NSLog(@"Extscreen size: %@", NSStringFromCGSize(rect.size));
    
    // Create new outputWindow
    self.outputWindow = [[UIWindow alloc] initWithFrame:CGRectZero];
    _outputWindow.screen = secondaryScreen;
    _outputWindow.screen.currentMode = screenMode; // Thanks Scott Lawrence
    [_outputWindow makeKeyAndVisible];
    _outputWindow.frame = rect;
    
    // Add image to outputWindow
    backgroundColorWhite = [[UIImageView alloc] initWithFrame:_outputWindow.frame];
    backgroundColorWhite.backgroundColor = [UIColor whiteColor];
    backgroundColorWhite.contentMode = UIViewContentModeScaleAspectFit;
    [backgroundColorWhite setImage:backgoundImage];
    
    // Add label
    UILabel  *xlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    xlabel.text = @"xxx";
    [backgroundColorWhite addSubview:xlabel];
    
    baseView = [[UIImageView alloc] initWithFrame:rect];
    //    baseView.backgroundColor = color;
    [_outputWindow addSubview:backgroundColorWhite];
    
    
    //    NSLog(@"setup external screen done");
}

- (id) init
{
    if (!(self = [super init])) return self;
    
    //    color = [UIColor redColor];
    backgoundImage = [UIImage imageNamed:@"nature.jpg"];
    
    // Handle output window creation
    if (SCREEN_CONNECTED)
        [self screenDidConnect:nil];
    
    return self;
}

@end