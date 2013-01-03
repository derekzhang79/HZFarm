//
//  Login_UserChooseLayer.h
//  LoginUI
//
//  Created by mac on 12-4-23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Login_UserChooseLayer : CCSprite 
{
    CCSprite        *blueBar;
    CCLabelTTF      *label;
    NSString        *username;
    //bool            isSelected;
}

//@property (nonatomic, assign) bool isSelected;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) CCSprite *blueBar;

-(id) initWithString: (NSString*)username;
-(void) itemEnable;
-(void) itemDisable;

@end
