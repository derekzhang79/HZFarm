//
//  SiLiaoChi.h
//  Sheds
//
//  Created by Any on 12-4-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShedsModelServer.h"

typedef enum{
    shiCao = 1,
    shuiCao
}ShiCaoType;

@interface SiLiaoChi : CCLayer {
    id<ShedsModelServer> _delegate;
    
    CCSprite *_up;
    CCSprite *_down;
    CCSprite *_fall;
    CCAction *_addAction_up;
    CCAction *_addAction_down;
    CCAction *_addAction_fall;
    ShiCaoType _type;
    CCSprite *_shadow;
}

@property (nonatomic, retain)CCSprite *_up;
@property (nonatomic, retain)CCSprite *_down;
@property (nonatomic, retain)CCSprite *_fall;
@property (nonatomic, retain)CCAction *_addAction_up;
@property (nonatomic, retain)CCAction *_addAction_down;
@property (nonatomic, retain)CCAction *_addAction_fall;
@property (nonatomic)ShiCaoType _type;
@property (nonatomic, assign)id<ShedsModelServer> _delegate;
@property (nonatomic, retain)CCSprite *_shadow;

- (id)initWithType:(NSInteger)type delegate:(id)delegate;

- (void)setNum:(NSInteger)num;

- (CGRect)getRect;

- (void)add;

@end
