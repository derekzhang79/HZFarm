//
//  WarningDialog.m
//  Sheds
//
//  Created by Any on 12-4-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "WarningDialog.h"


@implementation WarningDialog

@synthesize _delegate;

- (id)initWithTip:(NSString *)tips
{
    if ((self = [super init])) {
        
        _delegate = nil;
        
        CCCallFuncN* call_iws1 = [CCCallFuncN actionWithTarget:self selector:@selector(CallPop:)];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *dialog = [CCSprite spriteWithFile:@"warningDialog.png"];
        dialog.position = ccp(size.width/2, size.height/2);
        dialog.anchorPoint = ccp(0.5, 0.5);
        [self addChild:dialog z:1];
        
        CCSprite *popUp = [CCSprite spriteWithFile:@"pop-up.png"];
        popUp.position = ccp(140, 40);
        popUp.anchorPoint = ccp(0, 0);
        [dialog addChild:popUp z:1];
        
        CCLabelTTF *tip = [CCLabelTTF labelWithString:tips dimensions:CGSizeMake(300,100)alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:28];
        tip.color = ccc3(0, 0, 0);
        tip.position = ccp(200, 100);
        tip.anchorPoint = ccp(0, 0);
        [dialog addChild:tip z:2];
        
        CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
        woman.position = ccp(5, 5);
        woman.anchorPoint = ccp(0, 0);
        [dialog addChild:woman z:1];
        
        CCMenuItemImage *ISee = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(ok:)];
        

        CCMenu *menu = [CCMenu menuWithItems:ISee, nil]; 
        menu.position = ccp(250, 280);
        [dialog addChild:menu z:2];
        
        [dialog runAction:call_iws1];
        
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:kCCMenuTouchPriority swallowsTouches:YES];
    }
    
    return self;
}

-(void) CallPop :(id)sender
{
    CCAction *delay = [CCDelayTime actionWithDuration: 0.05f];
    CCAction *scaleBigger1 = [CCScaleTo actionWithDuration:0.1 scale:1.15];
    CCAction *scaleBigger2 = [CCScaleTo actionWithDuration:0.07 scale:1.05];
    CCAction *scaleSmaller = [CCScaleTo actionWithDuration:0.1 scale:1];
    CCAction *act = [CCSequence actions: scaleBigger1, delay,scaleSmaller,delay,scaleBigger2, delay,scaleSmaller, nil];
    [sender runAction:act];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

- (void)ok: (id) sender
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [self._delegate removeDialog];
}

- (void)dealloc
{
    [super dealloc];
}

@end
