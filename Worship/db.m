//
//  db.m
//  Worship
//
//  Created by michael febrianto on 5/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Db.h"

@implementation Db

- (id) init
{
    if (!(self = [super init])) return self;
    
    return self;
}

- (NSString*)getFile:(NSString*)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSString *read_content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    return read_content;
}

@end