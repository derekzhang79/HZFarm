//
//  DACatchFileService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DACatchFileService : NSObject
+(NSString*) getAppDocumentsDir;
+(NSString*) getFarmDBDir;
+ (BOOL) directoryCreate : (NSString *)directory;
+(BOOL) FileExit:(NSString*) path;
@end
