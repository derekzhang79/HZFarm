//
//  DACatchFileService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DACatchFileService.h"

@implementation DACatchFileService

+(NSString*) getAppDocumentsDir
{
    static NSString *documentsDir;
    if (!documentsDir) {
        NSArray *pathArr=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDir=[[pathArr objectAtIndex:0] retain];
    }
    return documentsDir;
}
//创建目录，成功则返回YES
+ (BOOL) directoryCreate : (NSString *)directory
{
	BOOL bRet = NO;
	NSString *path = directory;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bRet = [fileManager fileExistsAtPath:path];
	if (!bRet)
	{
		NSError * tmpErr = nil;
		bRet = [fileManager createDirectoryAtPath:path 
                      withIntermediateDirectories:YES 
                                       attributes:nil
                                            error:&tmpErr
                ];
		
	}
	return bRet;	
}

+(NSString*) getFarmDBDir
{
    static NSString *DBDir;
    if (!DBDir) {
        DBDir=[NSString stringWithFormat:@"%@/FarmDB.db", [self getAppDocumentsDir]];
    }
    return DBDir;
}
+(BOOL) FileExit:(NSString*) path
{
    NSFileManager* manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:path];
}
@end
