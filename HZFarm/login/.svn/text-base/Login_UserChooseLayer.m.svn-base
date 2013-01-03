//
//  Login_UserChooseLayer.m
//  LoginUI
//
//  Created by mac on 12-4-23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Login_UserChooseLayer.h"
#import "Import.h"


@implementation Login_UserChooseLayer

@synthesize username;
@synthesize blueBar;
//@synthesize isSelected;

-(id) initWithString: (NSString*)username
{
    if (self = [super initWithFile:@"蓝条条0.png"])
    {
        //self.isTouchEnabled = YES;
        self.username = username;
        //self.isSelected = false;
        
        //blueBar = [CCSprite spriteWithFile:@"蓝条条0.png"];
//        blueBar = [CCMenuItemImage itemFromNormalImage:@"蓝条条1.png" selectedImage:@"蓝条条0.png" disabledImage:@"蓝条条0.png" target:self selector:@selector(back:)];
//        CCMenu *menu4 = [CCMenu menuWithItems:blueBar, nil];
//        blueBar.opacity = 0;
//        //blueBar.position = CCXY(790, 710);
//        blueBar.anchorPoint = ccp(0, 0);
//        blueBar.position = ccp(-blueBar.contentSize.width/2, -blueBar.contentSize.height/2);
//        
//        [self addChild:blueBar z: 1];
        self.opacity = 0;
        
        label = [CCLabelTTF labelWithString:self.username fontName:@"Verdana-Bold" fontSize:30];
        CGSize size = self.contentSize;
        label.color = ccc3(0, 0, 0);
        label.position = ccp(size.width/2, size.height/2+3);
        [self addChild:label z:1 tag:1];
    }
    return self;
}

-(void) dealloc
{
    [username release];
    [super dealloc];
}

//-(id) init
//{
//    if (self = [super init])
//    {
//        self.isTouchEnabled = YES;
//        
//
//    }
//    
//    return self;
//}

-(void) itemEnable
{
    //self.isSelected = YES;
    self.opacity = 255;
    label.color = ccc3(255, 255, 255);
}

-(void) itemDisable
{
    //self.isSelected = NO;
    self.opacity = 0;
    label.color = ccc3(0, 0, 0);
}



//-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self itemEnable];
//}
//
//-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self itemDisable];
//}

//-(void) registerWithTouchDispatcher
//{
//    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self 
//                                                     priority:0 swallowsTouches:YES];
//    
//   // [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:menu priority:kCCMenuTouchPriority swallowsTouches:YES];
//}
//
//-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    //获取触摸点,并转换成cocos2d可识别的OpenGL坐标
//    CGPoint touchLocation = [touch locationInView: [touch view]]; 
//    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
//    touchLocation = [self convertToNodeSpace:touchLocation];
//    
//    if (CGRectContainsPoint(self.boundingBox, touchLocation))
//    {
//        
//    }
//    [self itemEnable];
//    
//    return NO;
//}
//
//-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    [self itemDisable];
//}

- (BOOL)containsTouchLocation:(UITouch *)touch
{
    CGPoint pt = [self convertTouchToNodeSpaceAR:touch];
//    NSLog([NSString stringWithFormat:@"Rect x=%.2f, y=%.2f, width=%.2f, height=%.2f, Touch point: x=%.2f, y=%.2f", self.rect.origin.x, self.rect.origin.y, self.rect.size.width, self.rect.size.height, pt.x, pt.y]); 
    
    return YES;//CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}

-(void) back: (id)sender
{
    //label.color = ccc3(255, 255, 255);
    //[SceneManager goMenu];
}




@end
