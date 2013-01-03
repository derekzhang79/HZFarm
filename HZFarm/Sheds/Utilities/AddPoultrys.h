//
//  AddPoultrys.h
//  Sheds
//
//  Created by Any on 12-3-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Contents.h"
#import "AdderDelegate.h"

@interface AddPoultrys : CCLayer {
    
    id<AdderDelegate> _delegate;
    
    CCSprite *_sp;
    
    NSInteger _spType;
    
    BOOL _isAblePut;
}

@property (nonatomic, assign)id<AdderDelegate> _delegate;

- (void)readyToAdd:(NSString *)name pos:(CGPoint)pos unlockState:(NSMutableDictionary *)unlockState;

@end
