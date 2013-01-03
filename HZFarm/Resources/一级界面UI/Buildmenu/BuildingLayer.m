//
//  BuildingView.m
//  FARM
//
//  Created by Yunky on 12-4-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "BuildingLayer.h"
#import "Sperkermenuservice.h"

@implementation BuildingLayer

-(id) init
{
    if( (self=[super init])) {
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *bg = [CCSprite spriteWithFile:@"BuildingBackground.png"];
        bg.anchorPoint = ccp(0, 0);
        [self addChild:bg z:0];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        CCSprite *buildLogo = [CCSprite spriteWithFile:@"build.png"];
        buildLogo.position = ccp(500, 720);
        [self addChild:buildLogo z:0];
        
        //建筑按钮
        CCMenuItemImage *buildButton = [CCMenuItemImage itemFromNormalImage:@"build_0.png" 
                                                              selectedImage:@"build_1.png" 
                                                                     target:self 
                                                                   selector:@selector(showGeneralBuilding:)];
        //装饰按钮
        CCMenuItemImage *decorationButton = [CCMenuItemImage itemFromNormalImage:@"decoration_0.png" 
                                                                   selectedImage:@"decoration_1.png" 
                                                                          target:self 
                                                                        selector:@selector(showDecoration:)];        
        
        //左边2个按钮
        CCMenu *menu_left = [CCMenu menuWithItems: buildButton, decorationButton, nil];
        menu_left.position = ccp(125, 420);
        [menu_left alignItemsVerticallyWithPadding:25.0f];
        [self addChild:menu_left z:2];
        
        //金币图标
        CCSprite *spriteGold = [CCSprite spriteWithFile:@"gold.png"];
        spriteGold.position = ccp(260, 80);
        [self addChild:spriteGold z:1];
        CCSprite *spriteGoldBaseMap = [CCSprite spriteWithFile:@"numBar.png"];
        spriteGoldBaseMap.position = ccp(360, 80);
        [self addChild:spriteGoldBaseMap z:0];
        
        //下方金币数
        shopPlayerService = [DAPlayerService sharePlayerService];
        CCLabelAtlas *labelGoldBottom = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", shopPlayerService.playerEntity.nMoney]
                                                          charMapFile:@"gold_number.png" 
                                                            itemWidth:17 
                                                           itemHeight:25 
                                                         startCharMap:'0'];
        labelGoldBottom.position = ccp(410, 77);
        labelGoldBottom.anchorPoint = ccp(0.5, 0.5);
        [self addChild:labelGoldBottom z:3];
        
//       //钻石图标
//       CCSprite *spriteDiamond = [CCSprite spriteWithFile:@"diamond.png"];
//       spriteDiamond.position = ccp(600, 80);
//       [self addChild:spriteDiamond z:1];
//       CCSprite *spriteDiamondBaseMap = [CCSprite spriteWithFile:@"base map.png"];
//       spriteDiamondBaseMap.position = ccp(700, 80);
//       [self addChild:spriteDiamondBaseMap z:0];

//        //下方钻石数
//        CCLabelAtlas *labelDiamond = [CCLabelAtlas labelWithString:@"0000" 
//                                                        charMapFile:@"diamond number.png" 
//                                                         itemWidth:17 
//                                                        itemHeight:25
//                                                      startCharMap:'0'];
//        labelDiamond.position = ccp(760, 77);
//        labelDiamond.anchorPoint = ccp(0.5, 0.5);
//        [self addChild:labelDiamond z:3];
                
        //下方返回按钮
        CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" 
                                                             selectedImage:@"back_1.png" 
                                                                    target:self 
                                                                  selector:@selector(goBackWorldScene:)];        
        CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
        menu_rightbottom.position = ccp(950, 80);
        [self addChild:menu_rightbottom z:2];
        [self generalBuilding];
    }
    
    return self;
}

#pragma mark -
#pragma mark 普通建筑的操作
- (void)building:(id)sender
{
    if(sender == [generalBuildButton objectAtIndex:0]) {
        if (shopPlayerService.playerEntity.nMoney < 0) {
            UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                           message:@"您还不能建造该建筑哦！" 
                                                          delegate:nil 
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil, nil];
            [alview show];
            [alview release];  
            return ;
        }
        
        [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:1];
        CCScene *scene = [CCScene node];
        WorldLayer *worldLayer = [WorldLayer node];
        [scene addChild:worldLayer];        
        Firstlayermenu *menuLayer = [Firstlayermenu node];
        [scene addChild:menuLayer];
        [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]]; 
       
    }
    
    if (sender == [generalBuildButton objectAtIndex:1]) {
        if (shopPlayerService.playerEntity.nMoney < 0) {
            UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                           message:@"您还不能建造该建筑哦！" 
                                                          delegate:nil 
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil, nil];
            [alview show];
            [alview release];
			return ;
        }
        
        [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:2];
        CCScene *scene = [CCScene node];
        WorldLayer *worldLayer = [WorldLayer node];
        [scene addChild:worldLayer];
        Firstlayermenu *menuLayer = [Firstlayermenu node];
        [scene addChild:menuLayer];
        [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    

    }
    
    if(sender == [generalBuildButton objectAtIndex:2]) {
        if (shopPlayerService.playerEntity.nMoney < 0) {
            UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                           message:@"您还不能建造该建筑哦！" 
                                                          delegate:nil 
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil, nil];
            [alview show];
            [alview release];
			return ;
        }
        [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:3];
        CCScene *scene = [CCScene node];
        WorldLayer *worldLayer = [WorldLayer node];
        [scene addChild:worldLayer];
        Firstlayermenu *menuLayer = [Firstlayermenu node];
        [scene addChild:menuLayer];
        [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
        
        
    }
}

#pragma mark -
#pragma mark 切换到普通建筑（默认）
- (void)showGeneralBuilding:(id)sender
{
    [self removeChildByTag:1 cleanup:YES];
    [self removeChildByTag:2 cleanup:YES];
    [self removeChildByTag:3 cleanup:YES];
    [self generalBuilding];
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goBackWorldScene:)];
    CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
    menu_rightbottom.position = ccp(950, 80);
    [self addChild:menu_rightbottom z:2];
    

}

// 普通建筑视图
-(void)generalBuilding
{
    CCLayer* BuildBoxLayer = [CCLayer node];
    BuildBoxLayer.contentSize = CGSizeMake(762/*768*/, 500/*1155*/);
    generalBuildButton = [[NSMutableArray alloc] init];
    
    CCLabelTTF* infoLabel1 = [CCLabelTTF  labelWithString:@"可以在其中饲养禽类生物" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    CCLabelTTF* infoLabel1x = [CCLabelTTF  labelWithString:@"可以在其中饲养禽类生物" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel1x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel2 = [CCLabelTTF  labelWithString:@"可以使辐射范围内养鸡场拥有加工功能"
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    
    CCLabelTTF* infoLabel2x = [CCLabelTTF  labelWithString:@"可以使辐射范围内养鸡场拥有加工功能" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel2x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel3 = [CCLabelTTF  labelWithString:@"可以使辐射范围内养鸡场饲养的生物种类增加" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    CCLabelTTF* infoLabel3x = [CCLabelTTF  labelWithString:@"可以使辐射范围内养鸡场饲养的生物种类增加" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel3x.color = ccc3(0, 0, 0);
    
    NSArray* allInfoLabel = [NSArray arrayWithObjects:infoLabel1, infoLabel2, infoLabel3, nil];
    
    NSArray* allInfoLabelx = [NSArray arrayWithObjects:infoLabel1x, infoLabel2x, infoLabel3x, nil];
    
    NSArray* pic = [NSArray arrayWithObjects:@"鸡舍1级.png", @"加工厂一级.png", @"研究所一级.png", nil];
    
    NSArray* name = [NSArray arrayWithObjects:@"鸡舍", @"食品加工厂", @"研究所", nil];
    
    generalBuildMoney = [NSArray arrayWithObjects:@"000", @"000", @"000", nil];
    
    
    
    // 生成普通建筑选项
    for (int i = 0; i < 3; i++) {
         CCMenuItemImage *bottomButton = [CCMenuItemImage itemFromNormalImage:@"bottom_0.png" 
                                                               selectedImage:@"bottom_1.png" 
                                                                      target:self 
                                                                    selector:@selector(building:)];
       [generalBuildButton addObject:bottomButton];
        bottomButton.anchorPoint = ccp(0.5, 1);
        CCMenu *menu_bottom = [CCMenu menuWithItems:bottomButton, nil];
        menu_bottom.position = ccpAdd(ccp(90, 490/*1155*/-235*(i/4)),ccp((i%4 * 185), 0));
        [BuildBoxLayer addChild:menu_bottom z:0];
        
        //建筑名字
        CCLabelTTF *labelName = [CCLabelTTF labelWithString:[name objectAtIndex:i] fontName:@"FZHPJW" fontSize:18];
        labelName.color = ccWHITE;
        labelName.anchorPoint = ccp(0.5f, 0.5f);
        labelName.position = ccp(88, 195);
        [bottomButton addChild:labelName z:0 tag:1];
        bottomButton.anchorPoint = ccp(0.5, 1);
        
		//建筑图片
        CCSprite *spritePic = [CCSprite spriteWithFile:[pic objectAtIndex:i]];
        spritePic.anchorPoint = ccp(0.5f, 0.5f);
        spritePic.position = ccp(88, 125);
        [bottomButton addChild:spritePic z:0];
        spritePic.scale = 0.45;
        NSString *strname = [name objectAtIndex:i];
        
        //位置微调
        if ( [strname isEqualToString: @"鸡舍"]) {
            spritePic.position = ccp(88, 135);
            spritePic.scale = 0.4;
        }
//        if ([strname isEqualToString: @"食品加工厂"]) {
//            spritePic.position = ccp(88, 125);
//        }
        
//        if ([strname isEqualToString: @"研究所"]) {
//            //spritePic.scale = 1.3;
//            spritePic.position = ccp(88, 125);
//        }
        
        CCSprite *spriteCoinBar = [CCSprite spriteWithFile:@"black bar.png"];
        spriteCoinBar.anchorPoint = ccp(0.5f, 0.5f);
        spriteCoinBar.position = ccp(93, 27);
        [bottomButton addChild:spriteCoinBar z:0];
        CCSprite *spriteCoin = [CCSprite spriteWithFile:@"coin.png"];
        spriteCoin.anchorPoint = ccp(0.5f, 0.5f);
        spriteCoin.position = ccp(45, 28);
        [bottomButton addChild:spriteCoin z:0];
       
        //建筑价格
        CCLabelAtlas *labelMoney = [CCLabelAtlas labelWithString:[generalBuildMoney objectAtIndex:i] 
                                                     charMapFile:@"gold_number.png" 
                                                       itemWidth:17 
                                                      itemHeight:25 
                                                    startCharMap:'0'];
        labelMoney.anchorPoint = ccp(0.5f, 0.5f);
        labelMoney.position = ccp(125, 25);
        [labelMoney setScale:0.75f];
        [bottomButton addChild:labelMoney z:0];
       
        //建筑说明
        NSArray* infoLabel = [allInfoLabel objectAtIndex:i];
        ((CCLabelTTF*)infoLabel).position = ccp(bottomButton.contentSize.width/2, 35);
        [bottomButton addChild:(CCLabelTTF*)infoLabel z:0];

        NSArray* infoLabelx = [allInfoLabelx objectAtIndex:i];
        ((CCLabelTTF*)infoLabelx).position = ccp(bottomButton.contentSize.width/2, 35);
        [bottomButton addChild:(CCLabelTTF*)infoLabelx z:0];
    }
    
    SWScrollView *generalBuildBox = [SWScrollView viewWithViewSize:CGSizeMake(762/*735*/, 500)];
    generalBuildBox.position = ccp(245, 166);
    generalBuildBox.contentOffset = ccp(0, 0);
    generalBuildBox.contentSize = BuildBoxLayer.contentSize;
    generalBuildBox.direction = SWScrollViewDirectionVertical;
    generalBuildBox.bounces = NO;
    BuildBoxLayer.position = ccp(0, 0);
    [generalBuildBox addChild:BuildBoxLayer];
    //[generalBuildBox setContentOffset:CGPointMake(0, -678) animated:YES];
    [self addChild:generalBuildBox z:3 tag:2];
}

#pragma mark -
#pragma mark 切换到装饰建筑
- (void)showDecoration:(id)sender
{
    [self removeChildByTag:1 cleanup:YES];
    [self removeChildByTag:2 cleanup:YES];
    [self removeChildByTag:3 cleanup:YES];
	[self decoration];
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goBackWorldScene:)];
    CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
    menu_rightbottom.position = ccp(950, 80);
    [self addChild:menu_rightbottom z:2];
    

}

- (void)decoration
{
    CCLayer* BuildBoxLayer = [CCLayer node];
    BuildBoxLayer.contentSize = CGSizeMake(762/*768*/, 940/*1006*/);
    decorationBuildButton = [[NSMutableArray alloc] init];
    
//  NSString *path = [[NSBundle mainBundle] pathForResource:@"BuildingItem" ofType:@"plist"]; 
//  NSDictionary *tmp = [NSDictionary dictionaryWithContentsOfFile:path];
    
    CCLabelTTF* infoLabel1 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物消耗食物和水的速度同时减少1%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana"
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel1x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物消耗食物和水的速度同时减少1%" 
                                               dimensions:CGSizeMake(150, 80)
                                                alignment:UITextAlignmentLeft 
                                                 fontName:@"Verdana"
                                                 fontSize:13];
    infoLabel1x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel2 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+5%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel2x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+5%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel2x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel3 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物产蛋量+1" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel3x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物产蛋量+1" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel3x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel4 = [CCLabelTTF  labelWithString:@"使周围鸡舍中的生物不会生病" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel4x = [CCLabelTTF  labelWithString:@"使周围鸡舍中的生物不会生病" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel4x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel5 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+3%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel5x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+3%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel5x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel6 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+2%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel6x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+2%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel6x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel7 = [CCLabelTTF  labelWithString:@"降低周围鸡舍的耗食水量-1%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel7x = [CCLabelTTF  labelWithString:@"降低周围鸡舍的耗食水量-1%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel7x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel8 = [CCLabelTTF  labelWithString:@"降低周围鸡舍生物的耗水量-1%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel8x = [CCLabelTTF  labelWithString:@"降低周围鸡舍生物的耗水量-1%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel8x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel9 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+1%" 
                                           dimensions:CGSizeMake(150, 80)
                                            alignment:UITextAlignmentLeft 
                                             fontName:@"Verdana" 
                                             fontSize:13];
    //阴影
    CCLabelTTF* infoLabel9x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+1%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel9x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel10 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+3%" 
                                            dimensions:CGSizeMake(150, 80)
                                             alignment:UITextAlignmentLeft 
                                              fontName:@"Verdana" 
                                              fontSize:13];
    //阴影
    CCLabelTTF* infoLabel10x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+3%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel10x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel11 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+1%" 
                                            dimensions:CGSizeMake(150, 80)
                                             alignment:UITextAlignmentLeft 
                                              fontName:@"Verdana" 
                                              fontSize:13];
    //阴影
    CCLabelTTF* infoLabel11x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物生长速度+1%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel11x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel12 = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物产蛋量+1" 
                                            dimensions:CGSizeMake(150, 80)
                                             alignment:UITextAlignmentLeft 
                                              fontName:@"Verdana" 
                                              fontSize:13];
    //阴影
    CCLabelTTF* infoLabel12x = [CCLabelTTF  labelWithString:@"使周围鸡舍的生物产蛋量+%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel12x.color = ccc3(0, 0, 0);
    
    CCLabelTTF* infoLabel13 = [CCLabelTTF  labelWithString:@"降低周围鸡舍的耗食量-1%" 
                                            dimensions:CGSizeMake(150, 80)
                                             alignment:UITextAlignmentLeft 
                                              fontName:@"Verdana" 
                                                  fontSize:13];
    //阴影
    CCLabelTTF* infoLabel13x = [CCLabelTTF  labelWithString:@"降低周围鸡舍的耗食量-1%" 
                                                dimensions:CGSizeMake(150, 80)
                                                 alignment:UITextAlignmentLeft 
                                                  fontName:@"Verdana"
                                                  fontSize:13];
    infoLabel13x.color = ccc3(0, 0, 0);
    
    NSArray* allInfoLabel = [NSArray arrayWithObjects:infoLabel1,  infoLabel2,  infoLabel3,  infoLabel4, 
                                                      infoLabel5,  infoLabel6,  infoLabel7,  infoLabel8,
                                                      infoLabel9,  infoLabel10, infoLabel11, infoLabel12,
                                                      infoLabel13, nil];
    
    NSArray* allInfoLabelx = [NSArray arrayWithObjects:infoLabel1x,  infoLabel2x,  infoLabel3x,  infoLabel4x, 
                                                       infoLabel5x,  infoLabel6x,  infoLabel7x,  infoLabel8x,
                                                       infoLabel9x,  infoLabel10x, infoLabel11x, infoLabel12x,
                                                       infoLabel13x, nil];
                                                      
    
    NSArray* pic = [NSArray arrayWithObjects:@"风车磨坊2.png", @"小风车2.png",  @"看守者小屋.png", @"灵石.png", 
                                             @"柳树.png",   @"榕树.png",     @"桃树.png",     @"蓄水池.png",
                                             @"椰子树.png",  @"竹丛.png",    @"棕榈树.png",   @"金花木.png",
                                             @"小草堆.png", nil];
    
    NSArray* name = [NSArray arrayWithObjects:@"风车磨坊",  @"风车",   @"看守者小屋", @"灵石",
                                              @"柳树", 	   @"榕树",   @"桃树",      @"蓄水池",
                                              @"椰子树",    @"竹丛",   @"棕榈树",    @"金花木",
                                              @"小草堆", nil];

     money = [NSArray arrayWithObjects:        @"5500", @"1290", @"2800",  @"0000",
                                               @"830",  @"480",  @"4000",  @"2000",  
                                               @"1900", @"700",  @"1930",  @"20000", 
                                               @"2000", nil];
    // 生成装饰建筑选项
    for (int i = 0; i < 13; i++) {
        NSString *buildSelector = [NSString stringWithFormat:@"buildingmagic%i:", i];
        SEL buildIt = NSSelectorFromString(buildSelector);
        bottomButton = [CCMenuItemImage itemFromNormalImage:@"bottom_0.png" 
                                              selectedImage:@"bottom_1.png" 
                                                     target:self
                                                   selector:buildIt];
        bottomButton.anchorPoint = ccp(0.5, 1);
        CCMenu *menu_bottom = [CCMenu menuWithItems:bottomButton, nil];
        menu_bottom.position = ccpAdd(ccp(90, 930-235*(i/4)),ccp((i%4 * 185), 0));
        [BuildBoxLayer addChild:menu_bottom z:0];
        [decorationBuildButton addObject:bottomButton];        
        
        //建筑名字
        CCLabelTTF *labelName = [CCLabelTTF labelWithString:[name objectAtIndex:i] 
                                                   fontName:@"FZHPJW"
                                                   fontSize:18];
        labelName.color = ccWHITE;
        labelName.anchorPoint = ccp(0.5f, 0.5f);
        labelName.position = ccp(88, 190);
        [bottomButton addChild:labelName z:0 tag:1];
        bottomButton.anchorPoint = ccp(0.5, 1);
        
        // 建筑图片位置
        CCSprite *spritePic = [CCSprite spriteWithFile:[pic objectAtIndex:i]];
        spritePic.anchorPoint = ccp(0.5f, 0.5f);
        spritePic.position = ccp(88, 125);
        NSString *strname = [name objectAtIndex:i];
        
        // 建筑图片位置微调
    	if ([strname isEqualToString: @"看守者小屋"] ||
            [strname isEqualToString: @"榕树"]) {
            spritePic.scale = 0.4;
            spritePic.position = ccp(88, 120);
        }
        
        if ( [strname isEqualToString: @"风车"]) {
        	spritePic.scale = 0.5;
            spritePic.position = ccp(88, 118);
        }
        
    	if ( [strname isEqualToString: @"灵石"]) {
        	spritePic.anchorPoint = ccp(0.5,0.5);
            spritePic.position = ccp(88, 118);
        }
    	
    	if ( [strname isEqualToString: @"桃树"]) {
        	spritePic.scale = 0.5;
        	spritePic.position = ccp(88, 128);
        }
    	
    	if ( [strname isEqualToString: @"风车磨坊"]) {
            spritePic.scale = 0.3;
            spritePic.position = ccp(88, 125);
        }
        
    	if ( [strname isEqualToString: @"柳树"]) {
        	spritePic.scale = 0.4;
        	spritePic.position = ccp(88, 123);
        }
    	
    	if ( [strname isEqualToString: @"椰子树"]) {
        	spritePic.scale = 0.9;
        	spritePic.position = ccp(88, 125);
        }
        
        [bottomButton addChild:spritePic z:0];
        
        // 其它图片
        CCSprite *spriteCoinBar = [CCSprite spriteWithFile:@"black bar.png"];
        spriteCoinBar.anchorPoint = ccp(0.5f, 0.5f);
        spriteCoinBar.position = ccp(93, 27);
        [bottomButton addChild:spriteCoinBar z:0];
        CCSprite *spriteCoin = [CCSprite spriteWithFile:@"coin.png"];
        spriteCoin.anchorPoint = ccp(0.5f, 0.5f);
        spriteCoin.position = ccp(45, 28);
        [bottomButton addChild:spriteCoin z:0];
        
        //建筑价格
        CCLabelAtlas *labelMoney = [CCLabelAtlas labelWithString:[money objectAtIndex:i] 
                                                         charMapFile:@"gold_number.png" 
                                                           itemWidth:17 
                                                          itemHeight:25 
                                                        startCharMap:'0'];
        labelMoney.anchorPoint = ccp(0.5f, 0.5f);
        labelMoney.position = ccp(110, 25);
        [labelMoney setScale:0.75f];
        [bottomButton addChild:labelMoney z:0];
        
        //建筑说明
        NSArray* infoLabel = [allInfoLabel objectAtIndex:i];
        ((CCLabelTTF*)infoLabel).position = ccp(bottomButton.contentSize.width/2, 35);
        [bottomButton addChild:(CCLabelTTF*)infoLabel z:1];
        NSArray* infoLabelx = [allInfoLabelx objectAtIndex:i];
        ((CCLabelTTF*)infoLabelx).position = ccp(bottomButton.contentSize.width/2+1, 34);
        [bottomButton addChild:(CCLabelTTF*)infoLabelx z:0];
    }
    
    SWScrollView *decorationBuildBox = [SWScrollView viewWithViewSize:CGSizeMake(762/*735*/, 500)];
    decorationBuildBox.position = ccp(245, 166);
    decorationBuildBox.contentOffset = ccp(0, 0);
    decorationBuildBox.contentSize = BuildBoxLayer.contentSize;
    decorationBuildBox.direction = SWScrollViewDirectionVertical;
    decorationBuildBox.bounces = YES;
    BuildBoxLayer.position = ccp(0, 0);
    [decorationBuildBox addChild:BuildBoxLayer];
    [decorationBuildBox setContentOffset:CGPointMake(0, -440) animated:YES];
    [self addChild:decorationBuildBox z:3 tag:3];
}

#pragma mark -
#pragma mark 装饰建筑的操作
-(void)buildingmagic0:(id)sender
{
    
    if (shopPlayerService.playerEntity.nMoney < 5500/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
               
        return ;
	}
        [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:21];
        CCScene *scene = [CCScene node];
        WorldLayer *worldLayer = [WorldLayer node];
        [scene addChild:worldLayer];
        Firstlayermenu *menuLayer = [Firstlayermenu node];
        [scene addChild:menuLayer];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}

-(void)buildingmagic1:(id)sender
{    
    if (shopPlayerService.playerEntity.nMoney < 1290/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:4];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
	
}

-(void)buildingmagic2:(id)sender
{
    
    if (shopPlayerService.playerEntity.nMoney < 2800/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
        [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:5];
        
        CCScene *scene = [CCScene node];
        
        // 'layer' is an autorelease object.
        WorldLayer *worldLayer = [WorldLayer node];
        
        
        //Scene *sc = [Scene node]; 
        [scene addChild:worldLayer];
        
        Firstlayermenu *menuLayer = [Firstlayermenu node];
        [scene addChild:menuLayer];
        
    	[[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
}

-(void)buildingmagic3:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 0000/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
   [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:6];  
    
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
        
}

-(void)buildingmagic4:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 830/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:7];
    
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];        
}

-(void)buildingmagic5:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 480/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
     [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:8];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    

}

-(void)buildingmagic6:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 4000/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:9];
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    

}

-(void)buildingmagic7:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 2000/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
     [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:10];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    

}

-(void)buildingmagic8:(id)sender
{    
    if (shopPlayerService.playerEntity.nMoney < 1900/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
     [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:11];
    
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
    
}

-(void)buildingmagic9:(id)sender
{    
    if (shopPlayerService.playerEntity.nMoney < 700/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
     [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:12];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
    
}

-(void)buildingmagic10:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 1930/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:13];
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
     
}

-(void)buildingmagic11:(id)sender
{
    if (shopPlayerService.playerEntity.nMoney < 20000/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:14];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    

}

-(void)buildingmagic12:(id)sender
{    
    if (shopPlayerService.playerEntity.nMoney < 2000/*[[money objectAtIndex:0]intValue]*/) {
        UIAlertView * alview=[[UIAlertView alloc]initWithTitle:@"提示" 
                                                       message:@"您还不能建造该建筑哦！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" 
                                             otherButtonTitles:nil, nil];
        [alview show];
        [alview release];
        
        return ;
	}
    [[Sperkermenuservice  getSharedSperkermenuservice]makethekind:15];
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];    
    
}

#pragma mark -
- (void)goBackWorldScene:(id) sender
{
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];  
}

// 金钱不足禁止建造
//-(void) lackMoneyWarning
//{
//    Menu_MessageBox *message = [[Menu_MessageBox alloc]initWithMessage: @"抱歉!您当前金币不足，无法购买此物品!"];
//    message.anchorPoint = ccp(0.5, 0.5);
//    message.position = ccp(512, 384);
//    [self addChild:message z:20];
//    [message release];
//}


- (void) dealloc
{
//  [newBuildButton release];
//  newBuildButton = 0;
    [generalBuildButton release];
    generalBuildButton = 0;
    [decorationBuildButton release];
    decorationBuildButton = 0;
    
    [super dealloc];
}

@end