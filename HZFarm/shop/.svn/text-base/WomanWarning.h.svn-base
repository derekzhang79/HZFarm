//
//  WomanWarning.h
//  Shop
//
//  Created by hzbc on 4/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WomanWarningDelegate.h"

@interface WomanWarning : CCLayer {
    id <WomanWarningDelegate> _delegate;
    NSString *updateName;
    NSString *toolName;
    int flag123;
}

@property(nonatomic, assign) NSString *updateName;
@property(nonatomic, assign) NSString *toolName;
@property(nonatomic, assign) id _delegate;

-(void) buyUpdateWarning;
-(void) buyToolWarning;
-(void) updateWarning;
-(void) toolWarning;
-(void) lackMoneyWarning;
-(void) setMoney;
-(void) transportWarning;

@end
