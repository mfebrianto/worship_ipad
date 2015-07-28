//
//  ExternalScreen.h
//  Worship
//
//  Created by michael febrianto on 28/07/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <UIKit/UIKit.h> //this is for : UIScreen
#import <QuartzCore/QuartzCore.h>

@interface ExternalScreen : NSObject

{
    UIImageView *baseView;
    UIImage *backgoundImage;
    UIImageView *backgroundColorWhite;
}

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (strong, nonatomic) IBOutlet UIWindow *outputWindow;

- (void) changeBackgroundImage:(UIImage*)imageBackground;

@end
