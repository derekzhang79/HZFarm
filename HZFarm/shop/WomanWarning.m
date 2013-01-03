//
//  WomanWarning.m
//  Shop
//
//  Created by hzbc on 4/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "WomanWarning.h"
#import "DAPlayerService.h"
#import "DAPlayerEntity.h"
#import "ShopLayer.h"
#import "DAShopService.h"
#import "DAItemVehicle.h"
#import "DAItemService.h"
#import "DAItemProp.h"
#import "DAWareHouseService.h"

@implementation WomanWarning

@synthesize updateName, toolName, _delegate;

-(id) init{
    if( (self=[super init])) {
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
    }
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:kCCMenuTouchPriority swallowsTouches:YES];
    
    return self;
}

-(void) buyUpdateWarning
{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"您要立即购买此物品吗?" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(190, 20);
    [spriteWarningCenter addChild:label z:99];
    
    //立即购买按钮
    CCMenuItemImage *buyButton = [CCMenuItemImage itemFromNormalImage:@"buy_0.png" selectedImage:@"buy_1.png" target:self selector:@selector(clickUpdateBuy)];
    
    //下次再说按钮
    CCMenuItemImage *cancelButton = [CCMenuItemImage itemFromNormalImage:@"cancel_0.png" selectedImage:@"cancel_1.png" target:self selector:@selector(clickCancel)];
    
    //上边的两个按钮布局
    CCMenu *menu_top = [CCMenu menuWithItems:buyButton, cancelButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [menu_top alignItemsVerticallyWithPadding:15.0f];
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99];
}

-(void) buyToolWarning
{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"您要立即购买此物品吗?" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(190, 20);
    [spriteWarningCenter addChild:label z:99];
    
    //立即购买按钮
    CCMenuItemImage *buyButton = [CCMenuItemImage itemFromNormalImage:@"buy_0.png" selectedImage:@"buy_1.png" target:self selector:@selector(clickToolBuy)];
    
    //下次再说按钮
    CCMenuItemImage *cancelButton = [CCMenuItemImage itemFromNormalImage:@"cancel_0.png" selectedImage:@"cancel_1.png" target:self selector:@selector(clickCancel)];
    
    //上边的两个按钮布局
    CCMenu *menu_top = [CCMenu menuWithItems:buyButton, cancelButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [menu_top alignItemsVerticallyWithPadding:15.0f];
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99];
}


-(void) lackMoneyWarning{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"       抱歉！您当前金币不足，无法购买此物品！" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(210, 30);
    [spriteWarningCenter addChild:label z:99];
    
    CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
    
    CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99];
}

-(void) updateWarning{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"您已经拥有此交通工具，无法继续购买！" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(210, 30);
    [spriteWarningCenter addChild:label z:99];
    
    CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
    
    CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99]; 
}

-(void) toolWarning{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"您已经拥有此交通工具，无法继续购买！" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(210, 30);
    [spriteWarningCenter addChild:label z:99];
    
    CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
    
    CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99]; 
}

-(void) clickUpdateBuy{
    [self removeAllChildrenWithCleanup:YES];
    flag123 = 1;
    
    
    int a;
    DAItemProp *propObj = [[DAItemService shareService] GetGeneralItemByName:updateName GeneralItemType:GeneralItem_Prop];
    if (propObj) {
        a=propObj.nBuyPrice;
    }
    
    if ([DAPlayerService sharePlayerService].playerEntity.nMoney >= a) {
        [[DAPlayerService sharePlayerService] BuyItemFromShopByName:updateName ItemType:GeneralItem_Prop ItemNum:1];
        [self setMoney];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
        spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
        spriteWarning.position = ccp(size.width/2, size.height/2);
        
        CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
        spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
        spriteWarningCenter.position = ccp(310, 128);
        [spriteWarning addChild:spriteWarningCenter z:99];
        
        CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
        woman.anchorPoint = ccp(0.5f, 0.5f);
        woman.position = ccp(108, 113);
        [spriteWarning addChild:woman z:99];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@" 恭喜您！购买成功！" dimensions:CGSizeMake(160, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:30];
        label.color = ccBLACK;
        label.anchorPoint = ccp(0.5f, 0.5f);
        label.position = ccp(210, 25);
        [spriteWarningCenter addChild:label z:99];
        
        CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
        
        CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
        menu_top.anchorPoint = ccp(0.5f, 0.5f);
        menu_top.position = ccp(250, 290);
        [spriteWarning addChild:menu_top z:99];
        
        [self addChild:spriteWarning z:99];
    }else if([DAPlayerService sharePlayerService].playerEntity.nMoney < a){
        [self lackMoneyWarning];
    }
}

-(void) clickToolBuy{
    [self removeAllChildrenWithCleanup:YES];
    flag123 = 2;
    
    int a;
    DAItemProp *propObj = [[DAItemService shareService] GetGeneralItemByName:toolName GeneralItemType:GeneralItem_Prop];
    if (propObj) {
        a=propObj.nBuyPrice;
    }
    
    if ([DAPlayerService sharePlayerService].playerEntity.nMoney >= a) {
        [[DAPlayerService sharePlayerService] BuyItemFromShopByName:toolName ItemType:GeneralItem_Vehicle ItemNum:1];
        [self setMoney]; 
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
        spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
        spriteWarning.position = ccp(size.width/2, size.height/2);
        
        CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
        spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
        spriteWarningCenter.position = ccp(310, 128);
        [spriteWarning addChild:spriteWarningCenter z:99];
        
        CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
        woman.anchorPoint = ccp(0.5f, 0.5f);
        woman.position = ccp(108, 113);
        [spriteWarning addChild:woman z:99];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@" 恭喜您！购买成功！" dimensions:CGSizeMake(160, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:30];
        label.color = ccBLACK;
        label.anchorPoint = ccp(0.5f, 0.5f);
        label.position = ccp(210, 25);
        [spriteWarningCenter addChild:label z:99];
        
        CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
        
        CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
        menu_top.anchorPoint = ccp(0.5f, 0.5f);
        menu_top.position = ccp(250, 290);
        [spriteWarning addChild:menu_top z:99];
        
        [self addChild:spriteWarning z:99];
    }else if([DAPlayerService sharePlayerService].playerEntity.nMoney < a){
        [self lackMoneyWarning];
    }
}

-(void) transportWarning{
    [self removeAllChildrenWithCleanup:YES];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *spriteWarning = [CCSprite spriteWithFile:@"pop-up_0.png"];
    spriteWarning.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarning.position = ccp(size.width/2, size.height/2);
    
    CCSprite *spriteWarningCenter = [CCSprite spriteWithFile:@"pop-up_1.png"];
    spriteWarningCenter.anchorPoint = ccp(0.5f, 0.5f);
    spriteWarningCenter.position = ccp(310, 128);
    [spriteWarning addChild:spriteWarningCenter z:99];
    
    CCSprite *woman = [CCSprite spriteWithFile:@"woman.png"];
    woman.anchorPoint = ccp(0.5f, 0.5f);
    woman.position = ccp(108, 113);
    [spriteWarning addChild:woman z:99];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"       抱歉！您当前金币不足，无法运送物品！" dimensions:CGSizeMake(200, 200) alignment:UITextAlignmentLeft fontName:@"FZHPJW--GB1-0" fontSize:25];
    label.color = ccBLACK;
    label.anchorPoint = ccp(0.5f, 0.5f);
    label.position = ccp(210, 30);
    [spriteWarningCenter addChild:label z:99];
    
    CCMenuItemImage *iseeButton = [CCMenuItemImage itemFromNormalImage:@"I SEE_0.png" selectedImage:@"I SEE_1.png" target:self selector:@selector(clickCancel)];
    
    CCMenu *menu_top = [CCMenu menuWithItems:iseeButton, nil];
    menu_top.anchorPoint = ccp(0.5f, 0.5f);
    menu_top.position = ccp(250, 290);
    [spriteWarning addChild:menu_top z:99];
    
    [self addChild:spriteWarning z:99];
}

-(void) setMoney
{
    [self._delegate gold:flag123];
}


-(void) clickCancel{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [self removeAllChildrenWithCleanup:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

- (void)dealloc
{
    [super dealloc];
}

@end
