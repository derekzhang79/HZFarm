//
//  SceneManager.h
//  MapTest
//
//  Created by mac on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorldLayer.h"
#import "ShedsController.h"
#import "Menu_Help.h"
#import "Menu_About.h"
#import "Menu_Setting.h"
#import "LogoAnimation.h"


@interface SceneManager : NSObject
{
    
}

+(void) goLogoAnimation;
+(void) goLogin;
+(void) backLogin;
+(void) goFirstScene;
+(void) goFirstScene: (CCLayer*)firstScene;
+(void) goSecondScene:(NSString *)shedsId;

+(void) goHelp;
+(void) goAbout;
+(void) goSetting;
//+(void) backMenu;
//
//+(void) goStart;
//+(void) goSetting;
//+(void) goScores;
//+(void) goHowToPlay;


//+(void) goGameOver;

@end
