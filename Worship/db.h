//
//  db.h
//  Worship
//
//  Created by michael febrianto on 5/08/2015.
//  Copyright (c) 2015 f2. All rights reserved.
//

@interface Db : NSObject
{

}
- (NSString*)getFile:(NSString*)fileName;
- (NSString*)removeFile:(NSString*)fileName;

@end