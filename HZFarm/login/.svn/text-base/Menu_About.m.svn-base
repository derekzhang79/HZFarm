//
//  Menu_About.m
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Menu_About.h"
#import "Import.h"
#import "SceneManager.h"


@implementation Menu_About

-(void) dealloc
{
    [super dealloc];
}

-(id) init
{
    if (self = [super init])
    {
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        CCSprite *background = [CCSprite spriteWithFile:@"base maps.png"];
        background.position = ccp(width/2, height/2);
        [self addChild:background];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"help底图.png"];  
        bg.position = CCXY(512, 388);
        [self addChild:bg];
        
        CCSprite *title = [CCSprite spriteWithFile:@"关于条幅.png"];
        title.position = CCXY(512, 134);
        [self addChild:title];
        
        
        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" disabledImage:@"back_0.png" target:self selector:@selector(back:)];
        CCMenu *menu4 = [CCMenu menuWithItems:back, nil];
        menu4.position = CCXY(808, 603);
        [self addChild:menu4 z: 1];
        
        
        /******************Help*************************/
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"\t\t\t\t\t\t\t\t\t\t\t汇智农场\n\n北京汇智博创科技有限公司\n\n\t\t\thttp://hzbcpx.com/" dimensions:CGSizeMake(624, 400) alignment:UITextAlignmentLeft fontName:@"Verdana" fontSize:40];
        label.color = ccc3(73, 90, 32);
        
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp(size.width/2+65, size.height/2-70);
        [self addChild:label];

    }
    return self;
}

-(void) back: (id)sender
{
    [SceneManager backLogin];
}

@end
