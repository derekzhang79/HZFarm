//
//  FirstWriteFile.m
//  Sheds
//
//  Created by Any on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstWriteFile.h"
#import "Contents.h"

@implementation FirstWriteFile

- (void)writeStates
{
    Contents *m = [Contents getContents];
    NSFileManager * fileManager = [NSFileManager defaultManager];  
    
    //--------------------------------------------------ShedsUnlockStates.plist-------------------------------------------------------------
    //判断文件是否存在  
    if (![[NSFileManager defaultManager] fileExistsAtPath:m.filename_states]) {//如果文件不存在则创建  
        
        [fileManager changeCurrentDirectoryPath:[m.filename_states stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:m.filename_states contents:nil attributes:nil]; 
    }
    else{
        return;
    }
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:20];
    NSMutableDictionary *unlockStates =  [NSMutableDictionary dictionaryWithCapacity:9];
    NSMutableDictionary *gameStates =  [NSMutableDictionary dictionaryWithCapacity:9];
    [unlockStates setObject:[NSNumber numberWithBool:YES] forKey:@"poultry1"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry2"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry3"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry4"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry5"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry6"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry7"];
    [unlockStates setObject:[NSNumber numberWithBool:NO] forKey:@"poultry8"];
    [gameStates setObject:[NSNumber numberWithInteger:0] forKey:@"score"];
    [gameStates setObject:[NSNumber numberWithInteger:1] forKey:@"level"];
    [gameStates setObject:[NSNumber numberWithInteger:1000] forKey:@"money"];
    [gameStates setObject:[NSNumber numberWithInteger:0] forKey:@"diamond"];
    [gameStates setObject:[NSNumber numberWithInteger:5] forKey:@"maxPoultryNum"];
    [gameStates setObject:[NSNumber numberWithInteger:100] forKey:@"water"];
    [gameStates setObject:[NSNumber numberWithInteger:100] forKey:@"food"];
    [states setObject:[[[NSDate alloc] init]autorelease] forKey:@"lastSignOut"];
    [states setObject:unlockStates forKey:@"unlockStates"];
    [states setObject:gameStates forKey:@"gameStates"];
    //------------------------------------下面这段是鸡舍当前放养的鸡--------------------------------------------------------
    NSMutableArray *poultrys = [NSMutableArray arrayWithCapacity:[[states objectForKey:@"maxChickNum"] intValue]];
    [states setObject:poultrys forKey:@"poultrys"];
    [states writeToFile:m.filename_states atomically:YES];
}

- (void)writeStandards
{
    Contents *m = [Contents getContents];
    NSFileManager * fileManager = [NSFileManager defaultManager];  
    
    //判断文件是否存在  
    if (![[NSFileManager defaultManager] fileExistsAtPath:m.filename_standard]) {//如果文件不存在则创建  
        
        [fileManager changeCurrentDirectoryPath:[m.filename_standard stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:m.filename_standard contents:nil attributes:nil]; 
        
    }
    else{
        return;
    }
    NSMutableDictionary *standard =  [NSMutableDictionary dictionaryWithCapacity:10];
    NSMutableDictionary *poultryStandard =  [NSMutableDictionary dictionaryWithCapacity:8];
    NSMutableDictionary *poultry1Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry1Standard setObject:[NSNumber numberWithInt:2] forKey:@"cost"];
    [poultry1Standard setObject:[NSNumber numberWithInt:25] forKey:@"price_sell"];
    [poultry1Standard setObject:[NSNumber numberWithInt:1] forKey:@"eggPrice"];
    [poultry1Standard setObject:[NSNumber numberWithInt:1] forKey:@"score"];
    [poultry1Standard setObject:[NSNumber numberWithFloat:0.75] forKey:@"timeBetween"];
    [poultry1Standard setObject:[NSNumber numberWithInt:3] forKey:@"maxEggsNum"];
    [poultry1Standard setObject:[NSNumber numberWithInt:3] forKey:@"layTimes"];
    [poultry1Standard setObject:[NSNumber numberWithInt:3] forKey:@"totalTime"];
    [poultry1Standard setObject:[NSNumber numberWithInt:2] forKey:@"adult"];
    [poultry1Standard setObject:[NSNumber numberWithInt:1] forKey:@"young"];
    [poultry1Standard setObject:[NSNumber numberWithInt:20] forKey:@"price_buy"];
    NSMutableDictionary *poultry2Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry2Standard setObject:[NSNumber numberWithInt:4] forKey:@"cost"];
    [poultry2Standard setObject:[NSNumber numberWithInt:58] forKey:@"price_sell"];
    [poultry2Standard setObject:[NSNumber numberWithInt:2] forKey:@"eggPrice"];
    [poultry2Standard setObject:[NSNumber numberWithInt:1] forKey:@"score"];
    [poultry2Standard setObject:[NSNumber numberWithFloat:1] forKey:@"timeBetween"];
    [poultry2Standard setObject:[NSNumber numberWithInt:3] forKey:@"maxEggsNum"];
    [poultry2Standard setObject:[NSNumber numberWithInt:3] forKey:@"layTimes"];
    [poultry2Standard setObject:[NSNumber numberWithInt:6] forKey:@"totalTime"];
    [poultry2Standard setObject:[NSNumber numberWithInt:4] forKey:@"adult"];
    [poultry2Standard setObject:[NSNumber numberWithInt:2] forKey:@"young"];
    [poultry2Standard setObject:[NSNumber numberWithInt:45] forKey:@"price_buy"];
    NSMutableDictionary *poultry3Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry3Standard setObject:[NSNumber numberWithInt:8] forKey:@"cost"];
    [poultry3Standard setObject:[NSNumber numberWithInt:150] forKey:@"price_sell"];
    [poultry3Standard setObject:[NSNumber numberWithInt:4] forKey:@"eggPrice"];
    [poultry3Standard setObject:[NSNumber numberWithInt:5] forKey:@"score"];
    [poultry3Standard setObject:[NSNumber numberWithFloat:4] forKey:@"timeBetween"];
    [poultry3Standard setObject:[NSNumber numberWithInt:4] forKey:@"maxEggsNum"];
    [poultry3Standard setObject:[NSNumber numberWithInt:3] forKey:@"layTimes"];
    [poultry3Standard setObject:[NSNumber numberWithInt:24] forKey:@"totalTime"];
    [poultry3Standard setObject:[NSNumber numberWithInt:16] forKey:@"adult"];
    [poultry3Standard setObject:[NSNumber numberWithInt:8] forKey:@"young"];
    [poultry3Standard setObject:[NSNumber numberWithInt:100] forKey:@"price_buy"];
    NSMutableDictionary *poultry4Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry4Standard setObject:[NSNumber numberWithInt:3] forKey:@"cost"];
    [poultry4Standard setObject:[NSNumber numberWithInt:95] forKey:@"price_sell"];
    [poultry4Standard setObject:[NSNumber numberWithInt:1] forKey:@"eggPrice"];
    [poultry4Standard setObject:[NSNumber numberWithInt:2] forKey:@"score"];
    [poultry4Standard setObject:[NSNumber numberWithFloat:1.5] forKey:@"timeBetween"];
    [poultry4Standard setObject:[NSNumber numberWithInt:4] forKey:@"maxEggsNum"];
    [poultry4Standard setObject:[NSNumber numberWithInt:4] forKey:@"layTimes"];
    [poultry4Standard setObject:[NSNumber numberWithInt:8] forKey:@"totalTime"];
    [poultry4Standard setObject:[NSNumber numberWithInt:6] forKey:@"adult"];
    [poultry4Standard setObject:[NSNumber numberWithInt:2] forKey:@"young"];
    [poultry4Standard setObject:[NSNumber numberWithInt:80] forKey:@"price_buy"];
    NSMutableDictionary *poultry5Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry5Standard setObject:[NSNumber numberWithInt:4] forKey:@"cost"];
    [poultry5Standard setObject:[NSNumber numberWithInt:220] forKey:@"price_sell"];
    [poultry5Standard setObject:[NSNumber numberWithInt:5] forKey:@"eggPrice"];
    [poultry5Standard setObject:[NSNumber numberWithInt:8] forKey:@"score"];
    [poultry5Standard setObject:[NSNumber numberWithFloat:6] forKey:@"timeBetween"];
    [poultry5Standard setObject:[NSNumber numberWithInt:4] forKey:@"maxEggsNum"];
    [poultry5Standard setObject:[NSNumber numberWithInt:4] forKey:@"layTimes"];
    [poultry5Standard setObject:[NSNumber numberWithInt:36] forKey:@"totalTime"];
    [poultry5Standard setObject:[NSNumber numberWithInt:24] forKey:@"adult"];
    [poultry5Standard setObject:[NSNumber numberWithInt:12] forKey:@"young"];
    [poultry5Standard setObject:[NSNumber numberWithInt:150] forKey:@"price_buy"];
    NSMutableDictionary *poultry6Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry6Standard setObject:[NSNumber numberWithInt:6] forKey:@"cost"];
    [poultry6Standard setObject:[NSNumber numberWithInt:280] forKey:@"price_sell"];
    [poultry6Standard setObject:[NSNumber numberWithInt:6] forKey:@"eggPrice"];
    [poultry6Standard setObject:[NSNumber numberWithInt:10] forKey:@"score"];
    [poultry6Standard setObject:[NSNumber numberWithFloat:8] forKey:@"timeBetween"];
    [poultry6Standard setObject:[NSNumber numberWithInt:4] forKey:@"maxEggsNum"];
    [poultry6Standard setObject:[NSNumber numberWithInt:4] forKey:@"layTimes"];
    [poultry6Standard setObject:[NSNumber numberWithInt:48] forKey:@"totalTime"];
    [poultry6Standard setObject:[NSNumber numberWithInt:32] forKey:@"adult"];
    [poultry6Standard setObject:[NSNumber numberWithInt:16] forKey:@"young"];
    [poultry6Standard setObject:[NSNumber numberWithInt:180] forKey:@"price_buy"];
    NSMutableDictionary *poultry7Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry7Standard setObject:[NSNumber numberWithInt:10] forKey:@"cost"];
    [poultry7Standard setObject:[NSNumber numberWithInt:430] forKey:@"price_sell"];
    [poultry7Standard setObject:[NSNumber numberWithInt:6] forKey:@"eggPrice"];
    [poultry7Standard setObject:[NSNumber numberWithInt:16] forKey:@"score"];
    [poultry7Standard setObject:[NSNumber numberWithFloat:9.5] forKey:@"timeBetween"];
    [poultry7Standard setObject:[NSNumber numberWithInt:5] forKey:@"maxEggsNum"];
    [poultry7Standard setObject:[NSNumber numberWithInt:5] forKey:@"layTimes"];
    [poultry7Standard setObject:[NSNumber numberWithInt:72] forKey:@"totalTime"];
    [poultry7Standard setObject:[NSNumber numberWithInt:48] forKey:@"adult"];
    [poultry7Standard setObject:[NSNumber numberWithInt:24] forKey:@"young"];
    [poultry7Standard setObject:[NSNumber numberWithInt:275] forKey:@"price_buy"];
    NSMutableDictionary *poultry8Standard =  [NSMutableDictionary dictionaryWithCapacity:11];
    [poultry8Standard setObject:[NSNumber numberWithInt:15] forKey:@"cost"];
    [poultry8Standard setObject:[NSNumber numberWithInt:720] forKey:@"price_sell"];
    [poultry8Standard setObject:[NSNumber numberWithInt:10] forKey:@"eggPrice"];
    [poultry8Standard setObject:[NSNumber numberWithInt:40] forKey:@"score"];
    [poultry8Standard setObject:[NSNumber numberWithFloat:16] forKey:@"timeBetween"];
    [poultry8Standard setObject:[NSNumber numberWithInt:5] forKey:@"maxEggsNum"];
    [poultry8Standard setObject:[NSNumber numberWithInt:5] forKey:@"layTimes"];
    [poultry8Standard setObject:[NSNumber numberWithInt:120] forKey:@"totalTime"];
    [poultry8Standard setObject:[NSNumber numberWithInt:80] forKey:@"adult"];
    [poultry8Standard setObject:[NSNumber numberWithInt:40] forKey:@"young"];
    [poultry8Standard setObject:[NSNumber numberWithInt:500] forKey:@"price_buy"];
    
    [poultryStandard setObject:poultry1Standard forKey:@"poultry1Standard"];
    [poultryStandard setObject:poultry2Standard forKey:@"poultry2Standard"];
    [poultryStandard setObject:poultry3Standard forKey:@"poultry3Standard"];
    [poultryStandard setObject:poultry4Standard forKey:@"poultry4Standard"];
    [poultryStandard setObject:poultry5Standard forKey:@"poultry5Standard"];
    [poultryStandard setObject:poultry6Standard forKey:@"poultry6Standard"];
    [poultryStandard setObject:poultry7Standard forKey:@"poultry7Standard"];
    [poultryStandard setObject:poultry8Standard forKey:@"poultry8Standard"];
    
    [standard setObject:poultryStandard forKey:@"poultryStandard"];
    [standard writeToFile:m.filename_standard atomically:YES];
}

- (void)wirteAnimFramesTime
{
    Contents *m = [Contents getContents];
    NSFileManager * fileManager = [NSFileManager defaultManager];  
    
    //判断文件是否存在  
    if (![[NSFileManager defaultManager] fileExistsAtPath:m.filename_frame]) {//如果文件不存在则创建  
        
        [fileManager changeCurrentDirectoryPath:[m.filename_frame stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:m.filename_frame contents:nil attributes:nil]; 
        
    }
    else{
        return;
    }
    NSMutableDictionary *frame =  [NSMutableDictionary dictionaryWithCapacity:2];
//-----------------------------------frameTime--------------------------------------------------------------
    NSMutableDictionary *frameTime =  [NSMutableDictionary dictionaryWithCapacity:8];
    NSMutableDictionary *poutry1FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry1FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry2FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry2FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry3FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry3FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry4FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry4FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry5FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry5FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry6FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry6FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry7FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultStay2"];
    [poutry7FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    NSMutableDictionary *poutry8FrameTime =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"eat"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"stay"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"walk"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultEat"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.3] forKey:@"adultStay"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.15] forKey:@"adultStay2"];
    [poutry8FrameTime setObject:[NSNumber numberWithFloat:0.2] forKey:@"adultWalk"];
    
    [frameTime setObject:poutry1FrameTime forKey:@"poultry1"];
    [frameTime setObject:poutry2FrameTime forKey:@"poultry2"];
    [frameTime setObject:poutry3FrameTime forKey:@"poultry3"];
    [frameTime setObject:poutry4FrameTime forKey:@"poultry4"];
    [frameTime setObject:poutry5FrameTime forKey:@"poultry5"];
    [frameTime setObject:poutry6FrameTime forKey:@"poultry6"];
    [frameTime setObject:poutry7FrameTime forKey:@"poultry7"];
    [frameTime setObject:poutry8FrameTime forKey:@"poultry8"];
    
//-----------------------------------frameNum--------------------------------------------------------------
    
    NSMutableDictionary *frameNum =  [NSMutableDictionary dictionaryWithCapacity:8];
    NSMutableDictionary *poutry1FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultStay2"];
    [poutry1FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry2FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:5] forKey:@"adultEat"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:7] forKey:@"adultStay2"];
    [poutry2FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry3FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultStay2"];
    [poutry3FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry4FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:7] forKey:@"adultStay2"];
    [poutry4FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry5FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultStay2"];
    [poutry5FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry6FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:5] forKey:@"adultStay2"];
    [poutry6FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry7FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:11] forKey:@"adultStay2"];
    [poutry7FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    NSMutableDictionary *poutry8FrameNum =  [NSMutableDictionary dictionaryWithCapacity:7];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"eat"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"stay"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"walk"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:6] forKey:@"adultEat"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultStay"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:5] forKey:@"adultStay2"];
    [poutry8FrameNum setObject:[NSNumber numberWithInt:4] forKey:@"adultWalk"];
    
    [frameNum setObject:poutry1FrameNum forKey:@"poultry1"];
    [frameNum setObject:poutry2FrameNum forKey:@"poultry2"];
    [frameNum setObject:poutry3FrameNum forKey:@"poultry3"];
    [frameNum setObject:poutry4FrameNum forKey:@"poultry4"];
    [frameNum setObject:poutry5FrameNum forKey:@"poultry5"];
    [frameNum setObject:poutry6FrameNum forKey:@"poultry6"];
    [frameNum setObject:poutry7FrameNum forKey:@"poultry7"];
    [frameNum setObject:poutry8FrameNum forKey:@"poultry8"];
    
//-----------------------------------footPoint--------------------------------------------------------------
    
    NSMutableDictionary *poultryFootPoint =  [NSMutableDictionary dictionaryWithCapacity:8];
    
    NSMutableDictionary *footPoint1 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young1 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young1 setObject:[NSNumber numberWithInt:24] forKey:@"x"];
    [young1 setObject:[NSNumber numberWithInt:36] forKey:@"y"];
    NSMutableDictionary *adult1 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult1 setObject:[NSNumber numberWithInt:64] forKey:@"x"];
    [adult1 setObject:[NSNumber numberWithInt:86] forKey:@"y"];
    [footPoint1 setObject:young1 forKey:@"young"];
    [footPoint1 setObject:adult1 forKey:@"adult"];
    
    NSMutableDictionary *footPoint2 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young2 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young2 setObject:[NSNumber numberWithInt:30] forKey:@"x"];
    [young2 setObject:[NSNumber numberWithInt:41] forKey:@"y"];
    NSMutableDictionary *adult2 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult2 setObject:[NSNumber numberWithInt:75] forKey:@"x"];
    [adult2 setObject:[NSNumber numberWithInt:104] forKey:@"y"];
    [footPoint2 setObject:young2 forKey:@"young"];
    [footPoint2 setObject:adult2 forKey:@"adult"];
    
    NSMutableDictionary *footPoint3 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young3 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young3 setObject:[NSNumber numberWithInt:32] forKey:@"x"];
    [young3 setObject:[NSNumber numberWithInt:46] forKey:@"y"];
    NSMutableDictionary *adult3 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult3 setObject:[NSNumber numberWithInt:74] forKey:@"x"];
    [adult3 setObject:[NSNumber numberWithInt:108] forKey:@"y"];
    [footPoint3 setObject:young3 forKey:@"young"];
    [footPoint3 setObject:adult3 forKey:@"adult"];
    
    NSMutableDictionary *footPoint4 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young4 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young4 setObject:[NSNumber numberWithInt:32] forKey:@"x"];
    [young4 setObject:[NSNumber numberWithInt:46] forKey:@"y"];
    NSMutableDictionary *adult4 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult4 setObject:[NSNumber numberWithInt:72] forKey:@"x"];
    [adult4 setObject:[NSNumber numberWithInt:103] forKey:@"y"];
    [footPoint4 setObject:young4 forKey:@"young"];
    [footPoint4 setObject:adult4 forKey:@"adult"];
    
    NSMutableDictionary *footPoint5 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young5 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young5 setObject:[NSNumber numberWithInt:26] forKey:@"x"];
    [young5 setObject:[NSNumber numberWithInt:38] forKey:@"y"];
    NSMutableDictionary *adult5 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult5 setObject:[NSNumber numberWithInt:62] forKey:@"x"];
    [adult5 setObject:[NSNumber numberWithInt:88] forKey:@"y"];
    [footPoint5 setObject:young5 forKey:@"young"];
    [footPoint5 setObject:adult5 forKey:@"adult"];
    
    NSMutableDictionary *footPoint6 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young6 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young6 setObject:[NSNumber numberWithInt:30] forKey:@"x"];
    [young6 setObject:[NSNumber numberWithInt:41] forKey:@"y"];
    NSMutableDictionary *adult6 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult6 setObject:[NSNumber numberWithInt:120] forKey:@"x"];
    [adult6 setObject:[NSNumber numberWithInt:162] forKey:@"y"];
    [footPoint6 setObject:young6 forKey:@"young"];
    [footPoint6 setObject:adult6 forKey:@"adult"];
    
    NSMutableDictionary *footPoint7 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young7 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young7 setObject:[NSNumber numberWithInt:45] forKey:@"x"];
    [young7 setObject:[NSNumber numberWithInt:64] forKey:@"y"];
    NSMutableDictionary *adult7 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult7 setObject:[NSNumber numberWithInt:100] forKey:@"x"];
    [adult7 setObject:[NSNumber numberWithInt:143] forKey:@"y"];
    [footPoint7 setObject:young7 forKey:@"young"];
    [footPoint7 setObject:adult7 forKey:@"adult"];
    
    NSMutableDictionary *footPoint8 =  [NSMutableDictionary dictionaryWithCapacity:2];
    NSMutableDictionary *young8 = [NSMutableDictionary dictionaryWithCapacity:2];
    [young8 setObject:[NSNumber numberWithInt:46] forKey:@"x"];
    [young8 setObject:[NSNumber numberWithInt:64] forKey:@"y"];
    NSMutableDictionary *adult8 = [NSMutableDictionary dictionaryWithCapacity:2];
    [adult8 setObject:[NSNumber numberWithInt:114] forKey:@"x"];
    [adult8 setObject:[NSNumber numberWithInt:164] forKey:@"y"];
    [footPoint8 setObject:young8 forKey:@"young"];
    [footPoint8 setObject:adult8 forKey:@"adult"];
    
    [poultryFootPoint setObject:footPoint1 forKey:@"footPoint1"];
    [poultryFootPoint setObject:footPoint2 forKey:@"footPoint2"];
    [poultryFootPoint setObject:footPoint3 forKey:@"footPoint3"];
    [poultryFootPoint setObject:footPoint4 forKey:@"footPoint4"];
    [poultryFootPoint setObject:footPoint5 forKey:@"footPoint5"];
    [poultryFootPoint setObject:footPoint6 forKey:@"footPoint6"];
    [poultryFootPoint setObject:footPoint7 forKey:@"footPoint7"];
    [poultryFootPoint setObject:footPoint8 forKey:@"footPoint8"];
    
    
    [frame setObject:frameTime forKey:@"frameTime"];
    [frame setObject:frameNum forKey:@"frameNum"];
    [frame setObject:poultryFootPoint forKey:@"poultryFootPoint"];
    
    
    [frame writeToFile:m.filename_frame atomically:YES];
    
}

- (id)init{
    if ((self = [super init])) {
        [self writeStates];
        [self writeStandards];
        [self wirteAnimFramesTime];
    }
    
    return self;
}

@end
