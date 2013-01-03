//
//  EightDirFinder.h
//  MapTest
//
//  Created by Any on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define FINDER_LENGTH 30

@interface EightDirFinder : NSObject {
    
    CGPoint _pos;
    
    NSMutableDictionary *_dirs;
    
    NSMutableArray *_affactDir;
}
@property (nonatomic)CGPoint _pos;
@property (nonatomic, retain)NSMutableDictionary *_dirs;
@property (nonatomic, retain)NSMutableArray *_affactDir;

- (id)initWithPos:(CGPoint)pos;

- (NSInteger)dealWithColl:(NSMutableArray*)fences currDir:(NSInteger)currDir;

@end
