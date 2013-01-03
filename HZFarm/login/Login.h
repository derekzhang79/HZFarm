//
//  Login.h
//  LoginUI
//
//  Created by mac on 12-4-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Login_UserChooseLayer.h"
#import "SWScrollView.h"
#import "Firstlayermenu.h"
#import "LoadingScene.h"
#import "AudioController.h"



@interface Login : CCLayer <UITextFieldDelegate>
{
    UITextField     *gameNameTextField;
    NSMutableArray  *allUsers;
    SWScrollView    *userItemScrollView;
    LoadingScene    *loading;
    //NSArray         *allUserNames;
    int             numberOfUsers;          //从数据库获取用户总数
    int             currSelectIndex;
    CCSprite        *vbg;
    CCSprite        *firstNull;
    CCLabelTTF      *label;
    NSString        *chooseUser;            //最终选取的用户名 
    
    //bool            firstUIHasInit;
    bool            secondUIHasInit;
    
    int             UI_State;
    
}

@property (nonatomic, assign) int numberOfUsers;
@property (nonatomic, retain) SWScrollView *userItemScrollView;
//@property (nonatomic, retain) CCSprite *blueBar;


@end
