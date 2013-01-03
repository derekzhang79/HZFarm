//
//  Login.m
//  LoginUI
//
//  Created by mac on 12-4-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Login.h"
#import "Import.h"
#import <UIKit/UIKit.h>
#import "SceneManager.h"
#import "DAPlayerService.h"


#import "DAHenHousesDataService.h"
#import "DAPFactoryService.h"
#import "DAShopService.h"
#import "DAWareHouseService.h"
#import "DAWorldMapService.h"




@interface Login ()




@end



@implementation Login

@synthesize numberOfUsers;
@synthesize userItemScrollView;
//@synthesize blueBar;

-(void) dealloc
{
    //    [gameNameTextField release];
    //    gameNameTextField = nil;
    [allUsers release];
    allUsers = nil;
    [super dealloc];
}

enum
{
    UI_FIRST = 1,
    UI_SECOND
};

//第一个选择菜单
-(void) UI_first
{
    UI_State = UI_FIRST;

    int width = [[CCDirector sharedDirector] winSize].width;
    int height = [[CCDirector sharedDirector] winSize].height;
    
    label = [CCLabelTTF labelWithString:chooseUser fontName:@"Verdana-Bold" fontSize:32];
    CGSize size = self.contentSize;
    //label.color = ccc3(0, 0, 0);
    label.position = ccp(size.width/2-2, size.height/2-23);
    [self addChild:label z:1 tag:1];
        
    static bool firstUIHasInit = NO;
    //firstNull = (CCSprite*)[self getChildByTag:1];
    [firstNull removeAllChildrenWithCleanup:YES];
    
    CCSprite *kuang = [CCSprite spriteWithFile: @"框.png"];
    kuang.position = CCXY(width/2, 465);
    if (!firstUIHasInit)
    {
        kuang.scale = 0;
    }
    else 
    {
        kuang.scale = 1;
    }
    
    [firstNull addChild: kuang z:1];
    
    CCAction *kuangAction = [CCSequence actions:
                            [CCDelayTime actionWithDuration: 2.0f],
                            [CCEaseBackOut actionWithAction:
                            [CCScaleTo actionWithDuration:0.4 scale:1.0]],
                             nil];
    if (!firstUIHasInit)
    {
        [kuang runAction:kuangAction];
    }
        
        
    CCSprite *logo = [CCSprite spriteWithFile: @"logo.png"];
    if (!firstUIHasInit)
    {
        logo.position = CCXY(width/2, -600);
    }
    else 
    {
        logo.position = CCXY(width/2, 148);
    }
    
    [firstNull addChild: logo z:1];
    
    CCAction *logoAction = [CCSequence actions:
                            [CCDelayTime actionWithDuration: 1.4f],
                            [CCEaseBackOut actionWithAction:
                             [CCMoveTo actionWithDuration: 0.4 position:CCXY(width/2, 148)]],
                            nil];
    if (!firstUIHasInit)
    {
        [logo runAction:logoAction];
    }
        

//        CCSprite *cloud1 = [CCSprite spriteWithFile: @"云1.png"];
//        cloud1.position = CCXY(240, 155);
//        //cloud1.opacity = 230;
//        [firstNull addChild: cloud1 z:0];
//        
//        CCSprite *cloud2 = [CCSprite spriteWithFile: @"云2.png"];
//        cloud2.position = CCXY(780, 240);
//        //cloud2.opacity = 230;
//        [firstNull addChild: cloud2 z:0];
//        
//        CCSprite *cloud3 = [CCSprite spriteWithFile: @"云3.png"];
//        cloud3.position = CCXY(735, 60);
//        //cloud3.opacity = 220;
//        [firstNull addChild: cloud3 z:0];
        
    CCSprite *cloud1 = [CCSprite spriteWithFile: @"云1.png"];
    cloud1.position = CCXY(286, 220);
    cloud1.opacity = 0;
    [firstNull addChild: cloud1 z:0];
    CCAction *cloud1Action = [CCSequence actions:
                            [CCDelayTime actionWithDuration: 1.5f],
                             [CCFadeIn actionWithDuration: 4],
                            nil];
    [cloud1 runAction:cloud1Action];
    
    CCSprite *cloud2 = [CCSprite spriteWithFile: @"云2.png"];
    cloud2.position = CCXY(756, 214);
    cloud2.opacity = 0;
    [firstNull addChild: cloud2 z:0];
    CCAction *cloud2Action = [CCSequence actions:
                              [CCDelayTime actionWithDuration: 1.5f],
                              [CCFadeIn actionWithDuration: 4],
                              nil];
    [cloud2 runAction:cloud2Action];
    
    CCSprite *cloud3 = [CCSprite spriteWithFile: @"云3.png"];
    cloud3.position = CCXY(691, 97);
    cloud3.opacity = 0;
    [firstNull addChild: cloud3 z:0];
    CCAction *cloud3Action = [CCSequence actions:
                              [CCDelayTime actionWithDuration: 1.5f],
                              [CCFadeIn actionWithDuration: 4],
                              nil];
    [cloud3 runAction:cloud3Action];
    
    //左右飘动效果
    id allAct = [CCSequence actions:  
                 [CCMoveTo actionWithDuration:2 position:CCXY(310, 220)],
                 [CCMoveTo actionWithDuration:2 position:CCXY(286, 220)], nil];
    
    CCSequence *action = [CCSequence actions:
                          [CCRepeatForever actionWithAction:allAct],
                          nil];
    [cloud1 runAction: action];
    
    
    //左右飘动效果
    id allAct2 = [CCSequence actions:  
                  [CCMoveTo actionWithDuration:3 position:CCXY(726, 214)],
                  [CCMoveTo actionWithDuration:3 position:CCXY(756, 214)], nil];
    
    CCSequence *action2 = [CCSequence actions:
                           [CCRepeatForever actionWithAction:allAct2],
                           nil];
    [cloud2 runAction: action2];
    
        
    //左右飘动效果
    id allAct3 = [CCSequence actions:  
                  [CCMoveTo actionWithDuration:2 position:CCXY(660, 97)],
                  [CCMoveTo actionWithDuration:2 position:CCXY(691, 97)], nil];
    
    CCSequence *action3 = [CCSequence actions:
                           [CCRepeatForever actionWithAction:allAct3],
                           nil];
    [cloud3 runAction: action3];
    
    
    //        //左右飘动效果
    //        id allAct = [CCSequence actions:  
    //                     [CCMoveTo actionWithDuration:14 position:CCXY(760, 155)],
    //                     [CCMoveTo actionWithDuration:14 position:CCXY(240, 155)], nil];
    //        
    //        CCSequence *action = [CCSequence actions:
    //                              [CCRepeatForever actionWithAction:allAct],
    //                              nil];
    //        [cloud1 runAction: action];
    //        
    //        
    //        //左右飘动效果
    //        id allAct2 = [CCSequence actions:  
    //                      [CCMoveTo actionWithDuration:12 position:CCXY(250, 240)],
    //                      [CCMoveTo actionWithDuration:12 position:CCXY(780, 240)], nil];
    //        
    //        CCSequence *action2 = [CCSequence actions:
    //                               [CCRepeatForever actionWithAction:allAct2],
    //                               nil];
    //        [cloud2 runAction: action2];
    //        
    //        
    //        //左右飘动效果
    //        id allAct3 = [CCSequence actions:  
    //                      [CCMoveTo actionWithDuration:16 position:CCXY(280, 60)],
    //                      [CCMoveTo actionWithDuration:16 position:CCXY(735, 60)], nil];
    //        
    //        CCSequence *action3 = [CCSequence actions:
    //                               [CCRepeatForever actionWithAction:allAct3],
    //                               nil];
    //        [cloud3 runAction: action3];
    /***************************************************************************************/
    
    CCMenuItemImage *setting = [CCMenuItemImage itemFromNormalImage:@"帮助_0.png" selectedImage:@"帮助_1.png" disabledImage:@"帮助_0.png" target:self selector:@selector(help:)];
    CCMenu *menu = [CCMenu menuWithItems:setting, nil];
    if (!firstUIHasInit)
    {
        menu.position = CCXY(253, 800);
    }
    else 
    {
       menu.position = CCXY(253, 710);
    }
    
    [firstNull addChild:menu z: 1];
    
    CCAction *settingAction = [CCSequence actions:
                            [CCDelayTime actionWithDuration: 2.6f],
                            [CCEaseBackOut actionWithAction:
                             [CCMoveTo actionWithDuration: 0.4 position:CCXY(253, 710)]],
                            nil];
    if (!firstUIHasInit)
    {
        [menu runAction: settingAction];
    }
    
    
    
    //        CCMenuItemImage *prize = [CCMenuItemImage itemFromNormalImage:@"奖品_0.png" selectedImage:@"奖品_1.png" disabledImage:@"奖品_0.png" target:self selector:@selector(back:)];
    //        CCMenu *menu2 = [CCMenu menuWithItems:prize, nil];
    //        menu2.position = CCXY(428, 710);
    //        [firstNull addChild:menu2 z: 1];
    //        
    //        
    CCMenuItemImage *settings = [CCMenuItemImage itemFromNormalImage:@"设置_0.png" selectedImage:@"设置_1.png" disabledImage:@"设置_0.png" target:self selector:@selector(setting:)];
    CCMenu *menu3 = [CCMenu menuWithItems:settings, nil];
    if (!firstUIHasInit)
    {
        menu3.position = CCXY(512, 800);
    }
    else 
    {
        menu3.position = CCXY(512, 710);
    }
    [firstNull addChild:menu3 z: 1];
    CCAction *settingsAction = [CCSequence actions:
                             [CCDelayTime actionWithDuration: 2.6f],
                             [CCEaseBackOut actionWithAction:
                              [CCMoveTo actionWithDuration: 0.4 position:CCXY(512, 710)]],
                             nil];
    if (!firstUIHasInit)
    {
        [menu3 runAction: settingsAction];
    }
    
        
    CCMenuItemImage *about = [CCMenuItemImage itemFromNormalImage:@"关于_0.png" selectedImage:@"关于_1.png" disabledImage:@"关于_0.png" target:self selector:@selector(about:)];
    CCMenu *menu4 = [CCMenu menuWithItems:about, nil];
    if (!firstUIHasInit)
    {
        menu4.position = CCXY(774, 800);
    }
    else 
    {
        menu4.position = CCXY(774, 710);
    }
    
    [firstNull addChild:menu4 z: 1];
    
    CCAction *aboutAction = [CCSequence actions:
                               [CCDelayTime actionWithDuration: 2.6f],
                               [CCEaseBackOut actionWithAction:
                                [CCMoveTo actionWithDuration: 0.4 position:CCXY(774, 710)]],
                               nil];
    if (!firstUIHasInit)
    {
        [menu4 runAction: aboutAction];
    }
    
    
    
    CCMenuItemImage *username = [CCMenuItemImage itemFromNormalImage:@"选择用户名_0.png" selectedImage:@"选择用户名_1.png" disabledImage:@"选择用户名_0.png" target:self selector:@selector(chooseUser:)];
    CCMenu *menu5 = [CCMenu menuWithItems:username, nil];
//        menu5.position = CCXY(width/2, 487);
//        [firstNull addChild:menu5 z: 1];
    menu5.position = CCXYS(kuang, 280, 224);
    [kuang addChild:menu5 z: 1];

    
    CCMenuItemImage *life = [CCMenuItemImage itemFromNormalImage:@"生涯_0.png" selectedImage:@"生涯_1.png" disabledImage:@"生涯_0.png" target:self selector:@selector(gameStart:)];
    CCMenu *menu6 = [CCMenu menuWithItems:life, nil];
//        menu6.position = CCXY(width/2, 570);
//        [firstNull addChild:menu6 z: 1];
    menu6.position = CCXYS(kuang, 280, 310);
    [kuang addChild:menu6 z: 1];
    
    firstUIHasInit = true;
    
}


-(id) init
{
    if (self = [super init])
    {
        self.isTouchEnabled = YES;
        
        
        //获取数据库用户总数数据
        self.numberOfUsers = 0; 
        currSelectIndex = -1;
        chooseUser = nil;
        UI_State = UI_FIRST;
        
        
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        firstNull = [CCSprite node];
        firstNull.anchorPoint = ccp(0, 0);
        firstNull.position = ccp(0, 0);
        [self addChild:firstNull z:1 tag:1];
        
        CCSprite *bg = [CCSprite spriteWithFile: @"base maps.png"];
        bg.position = ccp(width/2, height/2);
        [self addChild: bg z:0];
        
        [self UI_first];
        
        if (![[AudioController sharedAudioController] isBackgroundMusicPlaying])
            [[AudioController sharedAudioController] playBackgroundMusic:@"EyesOnMe"];
        //        [self schedule:@selector(updateFrame:) interval:0.5];
    }
    
    return self;
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//	[textField resignFirstResponder];
//	return YES;
//}

-(void) initUserChooseItem
{
    CCSprite *bg = (CCSprite*)[firstNull getChildByTag:1];
    
    vbg = [CCSprite spriteWithFile:@"chooseVBG.png"];
    //self.blueBar = [CCSprite spriteWithFile:@"蓝条条0.png"];
    vbg.position = CCXYS(bg, 269, 236);
    [bg addChild:vbg z:1];
    //[vbg setTextureRect:CGRectMake(0, 0, 318, 150)];
    
    /******************SWScrollView*************************/
    NSArray *allUserNames = [[DAPlayerService sharePlayerService] GetAllPlayerName];
    int numberOfUsers = allUserNames.count;
    
    CGSize viewSize = CGSizeMake(318, 156);
    self.userItemScrollView = [SWScrollView viewWithViewSize:viewSize];
    self.userItemScrollView.anchorPoint = ccp(0.5f, 0.5f);
    self.userItemScrollView.position = CCXY(580, 467); //ccp(268, 291);
    self.userItemScrollView.contentOffset = ccp(0, -(numberOfUsers)*51+156);
    CGSize viewContentSize = CGSizeMake(318, (numberOfUsers)*51);
    self.userItemScrollView.contentSize = viewContentSize;
    self.userItemScrollView.direction = SWScrollViewDirectionVertical;
    self.userItemScrollView.bounces = YES;
    
    [self addChild:self.userItemScrollView z:3];
    
    /******************初始化用户名数组*************************/
    allUsers = [[NSMutableArray alloc] init];
    
    //[allUsers arrayWithArray:allUserNames];
    
    for(int i = 0; i <numberOfUsers; i++) 
    {
        NSString *username = [allUserNames objectAtIndex:i];//[NSString stringWithFormat:@"MagicYang%i", i];
        Login_UserChooseLayer *item = [[[Login_UserChooseLayer alloc] initWithString:username] autorelease];
        item.position = ccp(0, 55*i);
        [self.userItemScrollView addChild:item z:1 tag:i+1];
        [allUsers addObject:item];
        
        if (i == numberOfUsers-1)
        {
            [item itemEnable];
            chooseUser = username;
            currSelectIndex = 0;
        }
    }
    
    [self schedule:@selector(updateFrame:) interval:0.1];
    
}

/*****************************************第二个选择菜单***********************************************/
-(void) UI_second
{
    UI_State = UI_SECOND;
    chooseUser = nil;
    if (!secondUIHasInit)
    {
        //CCSprite *firstNull = (CCSprite*)[self getChildByTag:1];
        [firstNull removeAllChildrenWithCleanup:YES];
        
        CCSprite *bg = [CCSprite spriteWithFile: @"选择用户名底图.png"];
        bg.position = CCXY(724, 405);
        [firstNull addChild: bg z:0 tag:1];
        
        
        CCSprite *bg1 = [CCSprite spriteWithFile: @"输入用户名底图.png"];
        bg1.position = CCXY(261, -500);
        [firstNull addChild: bg1 z:0 tag:2];
        
        
        CCMenuItemImage *create = [CCMenuItemImage itemFromNormalImage:@"创建按钮_0.png" selectedImage:@"创建按钮_1.png" disabledImage:@"创建按钮_0.png" target:self selector:@selector(createUser:)];
        CCMenu *menu5 = [CCMenu menuWithItems:create, nil];
        menu5.position = ccp(157, 613-490);
        [bg addChild:menu5 z: 1];
        
        CCMenuItemImage *delete = [CCMenuItemImage itemFromNormalImage:@"删除_0.png" selectedImage:@"删除_1.png" disabledImage:@"删除_0.png" target:self selector:@selector(deleteUser:)];
        CCMenu *menu6 = [CCMenu menuWithItems:delete, nil];
        menu6.position = ccp(379, 613-490);
        [bg addChild:menu6 z: 1];
        
        CCMenuItemImage *ok = [CCMenuItemImage itemFromNormalImage:@"ok_0.png" selectedImage:@"ok_1.png" disabledImage:@"ok_0.png" target:self selector:@selector(backToLogin:)];
        CCMenu *menu7 = [CCMenu menuWithItems:ok, nil];
        menu7.position = ccp(274, 613-556);
        [bg addChild:menu7 z: 1];
        
        
        [self initUserChooseItem];
        
        //secondUIHasInit = YES;
    }
}




-(void) updateFrame: (ccTime)timeDelta
{
    for(int i = 0; i < allUsers.count; i++) 
    {
        Login_UserChooseLayer *item = [allUsers objectAtIndex:i];
        item.position = ccp(0, 55*i);
    }
}

//选择用户名UI响应
-(void)selectUser: (CGPoint)touchLocation
{
    int index = 0;
    for (Login_UserChooseLayer *item in allUsers)
    {
        [item itemDisable];
    }
    for (Login_UserChooseLayer *item in allUsers)
    {
        if (CGRectContainsPoint(item.boundingBox, touchLocation)) 
        {         
            currSelectIndex = index;
            [item itemEnable];
            return;
        }
        else 
        {
            chooseUser = nil;
        }
        index++;
    }
    currSelectIndex = -1;
}

//-(void) visit
//{
//    glEnable(GL_SCISSOR_TEST);
//    glScissor(0, 0, 318, 150);
//    [super visit];
//    glDisable(GL_SCISSOR_TEST);
//}


/****************************************************************************************/
-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (gameNameTextField)
    {
        [gameNameTextField resignFirstResponder];
        CCSprite *newUser = (CCSprite*)[firstNull getChildByTag:2];
        
        CCAction *action = [CCSequence actions:
                            [CCEaseBackIn actionWithAction:
                             [CCMoveTo actionWithDuration: 0.8 position:CCXY(261, -500)]],
                            nil];
        [newUser runAction:action];
        
        gameNameTextField.text = nil;
        [gameNameTextField removeFromSuperview];
        [gameNameTextField release];
        gameNameTextField = nil;
    }
}

//键盘输入结束，添加一个用户，
-(void) addUser: (NSString*) username
{
    Login_UserChooseLayer *item = [[[Login_UserChooseLayer alloc] initWithString:username] autorelease];
    [self.userItemScrollView addChild:item];
    [allUsers addObject:item];
    
    for (Login_UserChooseLayer *item1 in allUsers)
    {
        [item1 itemDisable];
    }
    currSelectIndex = 0;
    item.itemEnable;
    chooseUser = item.username;
    
    numberOfUsers = allUsers.count;
    self.userItemScrollView.contentOffset = ccp(0, -(numberOfUsers)*51+156);
    CGSize viewContentSize = CGSizeMake(318, (numberOfUsers)*51);
    self.userItemScrollView.contentSize = viewContentSize;
}

//点击Done按钮创建结束，保存用户名，数据库操作在这里完成
-(BOOL)textFieldDoneEditing:(UITextField *)textField
{
    NSString *username = gameNameTextField.text;
    
    //if (![username isEqualToString:@""]) 
    [gameNameTextField resignFirstResponder];
    
    //CCSprite *firstNull = (CCSprite*)[self getChildByTag:1];
    CCSprite *newUser = (CCSprite*)[firstNull getChildByTag:2];
    
    CCAction *action = [CCSequence actions:
                        [CCEaseBackIn actionWithAction:
                         [CCMoveTo actionWithDuration: 0.8 position:CCXY(261, -500)]],
                        nil];
    [newUser runAction:action];
    
    
    gameNameTextField.text = nil;
    [gameNameTextField removeFromSuperview];
    [gameNameTextField release];
    gameNameTextField = nil;
    
    
    if (![username isEqualToString:@""]) 
    {
        DAState* err = [[DAPlayerService sharePlayerService] AddPlayer:username];   //添加到数据库
        if (err.bErr)
        {
            UIAlertView *alert = [[UIAlertView alloc] 
                                  initWithTitle:@"添加用户失败" 
                                  message:err.errMsg 
                                  delegate:self 
                                  cancelButtonTitle:@"确定" 
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        else 
        {
            [[DAPlayerService sharePlayerService] RefeshPlayerData];
            
            [self addUser:username];
        }
        
    }
    
    return YES;
}




-(void) back: (id)sender
{
    //[SceneManager goMenu];
}

-(void) chooseUser: (id)sender
{
    //[SceneManager goMenu];
    //firstNull.position = ccp(1024,0);
    chooseUser = nil;
    label.string = nil;
    [self UI_second];
}

//创建用户操作
-(void) createUser: (id)sender
{
    if (!gameNameTextField)
    {
        //CCSprite *firstNull = (CCSprite*)[self getChildByTag:1];
        CCSprite *newUser = (CCSprite*)[firstNull getChildByTag:2];
        
        
        CCCallFuncN* call = [CCCallFuncN actionWithTarget:self selector:@selector(addUITextFieldAfterCreateUser:)];
        
        CCAction *action1 = [CCSequence actions:
                             [CCEaseBackOut actionWithAction:
                            [CCMoveTo actionWithDuration: 0.8 position:CCXY(261, 303)]],
                             nil];
        
        CCAction *action2 = [CCSequence actions:
                            [CCDelayTime actionWithDuration: 0.7f],
                            call,
                            nil];
        
        CCAction *action = [CCSpawn actions:
                            action1,
                            action2,
                            nil];
        
        [newUser runAction:action];
    }
}

//上一个函数结束后调用，显示准确
-(void) addUITextFieldAfterCreateUser: (id) sender
{
    //加入一个TextFiled
    gameNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(145,305,230,35)];
    gameNameTextField.delegate = self;
    [[[CCDirector sharedDirector] openGLView] addSubview:gameNameTextField];
    [gameNameTextField setBackgroundColor:[UIColor clearColor]];
    gameNameTextField.textColor = [UIColor whiteColor];
    gameNameTextField.textAlignment = UITextAlignmentCenter;
    gameNameTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    gameNameTextField.returnKeyType = UIReturnKeyDone;
    [gameNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [gameNameTextField addTarget:self action:@selector(textEditingChanged:)   forControlEvents:UIControlEventEditingChanged];
    //UIColor *color = [UIColor colorWithRed:1.0f green:50.0f blue:0.0f alpha:1.0f];
    gameNameTextField.font = [UIFont boldSystemFontOfSize:28];
    [gameNameTextField becomeFirstResponder];
}

//-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if ([gameNameTextField.text length] > 4)
//        //[gameNameTextField setText:[gameNameTextField.text substringToIndex:4]];
//        return NO;
//    return YES;
//}

-(void) help: (id)sender
{
    [SceneManager goHelp];
}

-(void) about: (id)sender
{
    [SceneManager goAbout];
}



//限制用户名字数为11
-(void)textEditingChanged:(UITextField *)textField
{
    if ([gameNameTextField.text length]>12) 
    {
        [gameNameTextField setText:[gameNameTextField.text substringToIndex:11]];
    }
}


//删除用户操作
-(void) deleteUser: (id)sender
{
    if (currSelectIndex >= 0)
    {
        Login_UserChooseLayer *item = [allUsers objectAtIndex:currSelectIndex];
        //NSString *username = item.username;
        NSString *username = [NSString stringWithString:item.username];
        
        [item removeFromParentAndCleanup:YES];
        [allUsers removeObjectAtIndex:currSelectIndex];
        //[self.userItemScrollView removeChild:item cleanup:YES];
        //[self.userItemScrollView removeChildByTag:1 cleanup:YES];
        
        numberOfUsers = allUsers.count;
        self.userItemScrollView.contentOffset = ccp(0, -(numberOfUsers)*51+156);
        CGSize viewContentSize = CGSizeMake(318, (numberOfUsers)*51);
        self.userItemScrollView.contentSize = viewContentSize;
        
        DAState *err = [[DAPlayerService sharePlayerService] DeletePlayer:username];   
        if (err.bErr)
        {
            UIAlertView *alert = [[UIAlertView alloc] 
                                  initWithTitle:@"删除失败" 
                                  message:@"删除操作失败！" 
                                  delegate:self 
                                  cancelButtonTitle:@"确定" 
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
        currSelectIndex = -1;
    }
}

//确定选取用户返回主界面
-(void) backToLogin: (id)sender
{
    if (currSelectIndex >= 0)
    {
        Login_UserChooseLayer *item = [allUsers objectAtIndex:currSelectIndex];
        chooseUser = item.username; 
    }
    else {
        chooseUser = nil; 
    }
    
    [self unschedule:@selector(updateFrame:)];
    
    gameNameTextField.text = nil;
    [gameNameTextField removeFromSuperview];
    [gameNameTextField release];
    gameNameTextField = nil;
    
    [vbg removeAllChildrenWithCleanup:YES];
    [self removeChild:self.userItemScrollView cleanup:YES];
    
    //self.isTouchEnabled = NO;
    [self UI_first];
}

-(void) gameStart: (id)sender
{
    if (chooseUser != nil)
    {
        
        loading = [LoadingScene node];
        loading.username = chooseUser;
        loading.anchorPoint = ccp(0, 1);
        [self removeAllChildrenWithCleanup:YES];
        [self addChild:loading];
        
        
//        [DAPlayerService sharePlayerService].curPlayerName=chooseUser;
//        [[DAPlayerService sharePlayerService]RefeshPlayerData];
//        [[DAWorldMapService shareWorldMapService]RefreshWorldMap];
//
//    
//
//        [[DAHenHousesDataService shareHenHouseDataService]RefreshAllHenHouseData];
//        [[DAPFactoryService sharePFactoryService]RefreshFactoryData];
//        [[DAShopService shareShopService]RefreshShopData];
//        [[DAWareHouseService shareWareHouseService]RefreshWareHouseData];
//
//     [SceneManager goFirstScene];


            //[SceneManager goFirstScene: self.layer0];


    }
    
}

-(void) setting: (id)sender
{
    [SceneManager goSetting];
}


-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取触摸点,并转换成cocos2d可识别的OpenGL坐标
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    if (UI_State == UI_SECOND)
    {
        CGPoint touchLocationNode = [self.userItemScrollView convertTouchToNodeSpace:touch];
        
        //计算点击位置在ScrollView中的位置，尤其是contentView中的位置
        int offset = touchLocationNode.y - self.userItemScrollView.contentOffset.y;
        touchLocationNode.y = offset;
        [self selectUser:touchLocationNode];
    }
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    //    CGPoint touchLocationNode = [vbg convertTouchToNodeSpace:touch]; 
    //    
    //    if (CGRectContainsPoint(vbg.boundingBox, touchLocationNode)) 
    //    {            
    //        CCLOG(@"sdfsdfsdfsf");
    //    }
}


//-(void) registerWithTouchDispatcher
//{
//    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self 
//                                                     priority:INT_MIN+1 swallowsTouches:YES];
//    
//   // [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:menu priority:kCCMenuTouchPriority swallowsTouches:YES];
//}

//-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    //获取触摸点,并转换成cocos2d可识别的OpenGL坐标
//    CGPoint touchLocation = [touch locationInView: [touch view]]; 
//    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
//    touchLocation = [self convertToNodeSpace:touchLocation];
//    
//    return NO;
//}
//
//-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    if (gameNameTextField)
//        [gameNameTextField resignFirstResponder];
//}




@end
