
#import <sqlite3.h>


@interface DBManager : NSObject

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;

-(void)copyDatabaseIntoDocumentsDirectory;
-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;

@end