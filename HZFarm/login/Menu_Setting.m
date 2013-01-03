//
//  Menu_Setting.m
//  MapTest
//
//  Created by mac on 12-4-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Menu_Setting.h"
#import "SceneManager.h"
#import "Import.h"
#import "AudioController.h"

@implementation Menu_Setting

static int musicVolumn = 85;
static int soundVolumn = 85;

+(int) getsoundVolumn
{
    return soundVolumn;
}

+(int) getMusicVolumn
{
    return musicVolumn;
}

-(void) dealloc
{
    [moveBlocks release];
    moveBlocks = nil;
    
    [super dealloc];
}

-(id) init
{
    if (self = [super init])
    {
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        self.isTouchEnabled = YES;
        
        CCSprite *background = [CCSprite spriteWithFile:@"base maps.png"];
        background.position = ccp(width/2, height/2);
        [self addChild:background];
        
//        CCSprite *bg = [CCSprite spriteWithFile:@"help底图.png"];  
//        bg.position = CCXY(512, 388);
//        [self addChild:bg];
        
        title = [CCSprite spriteWithFile:@"设置底图.png"];
        title.position = CCXY(515, 358);
        [self addChild:title];
        
        
        CCMenuItemImage *ok = [CCMenuItemImage itemFromNormalImage:@"ok_0.png" selectedImage:@"ok_1.png" disabledImage:@"ok_0.png" target:self selector:@selector(back:)];
        CCMenu *menu7 = [CCMenu menuWithItems:ok, nil];
        menu7.position = CCXYS(title, 266, 319);
        [title addChild:menu7 z: 1];
        
        
        bar1 = [CCSprite spriteWithFile:@"滑条.png"];
        bar1.anchorPoint = ccp(0, 1);
        bar1.position = CCXYS(title, 225, 147);
        [bar1 setTextureRect:CGRectMake(0, 0, soundVolumn, 28)];
        [title addChild:bar1];
        
        bar2 = [CCSprite spriteWithFile:@"滑条.png"];
        bar2.anchorPoint = ccp(0, 1);
        bar2.position = CCXYS(title, 225, 239);
        [bar2 setTextureRect:CGRectMake(0, 0, musicVolumn, 28)];
        [title addChild:bar2];
        
        block1 = [CCSprite spriteWithFile:@"滑条按钮_0.png"];
        //block1.position = CCXYS(title, 310, 161);
        block1.position = CCXYS(title, bar1.position.x+soundVolumn, 161);
        [title addChild:block1];
        
        block2 = [CCSprite spriteWithFile:@"滑条按钮_0.png"];
        //block2.position = CCXYS(title, 310, 254);
        block2.position = CCXYS(title, bar2.position.x+musicVolumn, 254);
        [title addChild:block2];
        /******************Help*************************/
        
        moveBlocks = [[NSMutableArray alloc] init];
        [moveBlocks addObject:block1];
        [moveBlocks addObject:block2];
        
        //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
    }
    return self;
}

- (void) adjustItem: (CGPoint)touchLocation 
{
    for (CCSprite *item in moveBlocks)
    {
        if (CGRectContainsPoint(item.boundingBox, touchLocation))
        {
            currChooseBlock = item;
        }
    }
} 

-(void) adjustVolumn:(CGPoint)translation
{ 
    if (currChooseBlock)
    {
        currChooseBlock.position = ccpAdd(currChooseBlock.position, CGPointMake(translation.x, 0));
        if (translation.x < 0)
        {         
            if (currChooseBlock.position.x < 242)
                currChooseBlock.position = ccp(242, currChooseBlock.position.y);
        }
        
        if (translation.x > 0)
        {
            if (currChooseBlock.position.x > 383)
                currChooseBlock.position = ccp(383, currChooseBlock.position.y);
        }
        
        if (currChooseBlock == block1)
        {
            soundVolumn += translation.x;
            soundVolumn = MIN(173-16, soundVolumn);
            soundVolumn = MAX(soundVolumn, 16);
            [bar1 setTextureRect:CGRectMake(0, 0, soundVolumn, 28)];
        }
        else
        {
            musicVolumn += translation.x;
            musicVolumn = MIN(173-16, musicVolumn);
            musicVolumn = MAX(16, musicVolumn);
            [bar2 setTextureRect:CGRectMake(0, 0, musicVolumn, 28)];
        }
    }
    float sound = (float)soundVolumn / 141;
    float music = (float)musicVolumn / 141;
    if (soundVolumn == 16)
        sound = 0.f;
    if (musicVolumn == 16)
        music = 0.f;
    [[AudioController sharedAudioController] setSoundVolume:sound];
    [[AudioController sharedAudioController] setMusicVolume:music];
}

//-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    currChooseBlock = nil;
//}
//
//- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
//{ 
//    CGPoint touchLocation = [title convertTouchToNodeSpace:touch];
//    [self adjustItem:touchLocation]; 
//    return NO; 
//}
//
//- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
//{ 
//    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
//    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
//    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
//    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
//    
//    CGPoint translation = ccpSub(touchLocation, oldTouchLocation); 
//    [self adjustVolumn:translation]; 
//}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取触摸点,并转换成cocos2d可识别的OpenGL坐标
    UITouch *touch = [touches anyObject];
//    CGPoint touchLocation = [touch locationInView: [touch view]];
//    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    
    CGPoint touchLocation = [title convertTouchToNodeSpace:touch];
    [self adjustItem:touchLocation];
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    currChooseBlock = nil;
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation); 
    [self adjustVolumn:translation]; 
}

-(void) back: (id)sender
{
    [SceneManager backLogin];
}

@end
