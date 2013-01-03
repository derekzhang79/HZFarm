//
//  ShopLayer.m
//  Shop
//
//  Created by hzbc on 4/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ShopLayer.h"
#import "WorldLayer.h"
#import "Firstlayermenu.h"
#import "DAShopService.h"
#import "DAItemVehicle.h"
#import "DAItemService.h"
#import "DAItemProp.h"
#import "DAWareHouseService.h"
#import "DAPlayerService.h"
#import "DateTool.h"
#import "DAItemTypeDefine.h"

@implementation ShopLayer

@synthesize womanWarn;

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
    if( (self=[super init])) {
        //背景 
        //[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        CCSprite *background = [CCSprite spriteWithFile:@"backgroundShop.png"];
        background.anchorPoint = ccp(0, 0);
        [self addChild:background z:1];
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        
        [self goToUpgrade];
        [self removeChildByTag:46 cleanup:YES];
        
        //升级证明按钮
        CCMenuItemImage *upgradeButton = [CCMenuItemImage itemFromNormalImage:@"upgrade_0.png" selectedImage:@"upgrade_1.png" target:self selector:@selector(goToUpgrade)];
        
        //运输工具按钮
        CCMenuItemImage *transportButton = [CCMenuItemImage itemFromNormalImage:@"transport_0.png" selectedImage:@"transport_1.png" target:self selector:@selector(goToTool)];
        
        //左边的三个按钮布局
        CCMenu *menu_left = [CCMenu menuWithItems:upgradeButton, transportButton, nil];
        menu_left.position = ccp(125, 420);
        [menu_left alignItemsVerticallyWithPadding:25.0f];
        [self addChild:menu_left z:99];
        
        //下方金币条图标
        CCSprite *spriteGold = [CCSprite spriteWithFile:@"gold.png"];
        spriteGold.position = ccp(660, 80);
        [self addChild:spriteGold z:99];
        CCSprite *spriteGoldBaseMap = [CCSprite spriteWithFile:@"numBar.png"];
        spriteGoldBaseMap.position = ccp(760, 80);
        [self addChild:spriteGoldBaseMap z:98];
        
        //下方返回按钮
        CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goToMap)];
        
        CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
        menu_rightbottom.position = ccp(950, 80);
        [self addChild:menu_rightbottom z:99 tag:46];
        
        //测试按钮
        CCMenuItemImage *testButton = [CCMenuItemImage itemFromNormalImage:@"Factory2.png" selectedImage:@"Factory3.png" target:self selector:@selector(test123)];
        
        CCMenu *menuTest = [CCMenu menuWithItems:testButton, nil];
        menuTest.position = ccp(110, 650);
        [self addChild:menuTest z:99];
    }
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:kCCMenuTouchPriority swallowsTouches:NO];
    
	return self;
}

-(void) test123
{
    [shopPlayerService DirectAddMoney:50000 Diamond:0];
//    [[DAPlayerService sharePlayerService] SetPlayerLeavtime:[DateTool Now]];
//    [[DAPlayerService sharePlayerService] RefeshPlayerData];
//    DAState * srcState  =[[DAPlayerService sharePlayerService] AddBuildingbyName:@"一级科研楼" Type:BuildingType_Magic PosX:100 posY:100 Tag:1 Zindex:1 BTans:YES];
//    DAState * destState = [[DAPlayerService sharePlayerService] AddBuildingbyName:@"一级科研楼" Type:BuildingType_Magic PosX:200 posY:200 Tag:1 Zindex:1 BTans:YES];
//    [[DAPlayerService sharePlayerService] UpgradMagicByDestFactoryID:srcState.ID SrcMagicID:destState.ID];
//    DAState *addBuildState = [[DAPlayerService sharePlayerService] AddBuildingbyName:@"一级鸡舍" Type:BuildingType_Breeding PosX:100 posY:100 Tag:109 Zindex:1 BTans:NO];
//    NSString *henHouseID = addBuildState.ID;
//    //添加一只幼年鸡
//    DAState *addPoultryState = [[DAPlayerService sharePlayerService] AddPoultryToHenHouse:henHouseID PoultryName:@"幼年鸡"];
//    NSString *chickID = addPoultryState.ID;
//    [[DAPlayerService sharePlayerService]AddWaterAndFoodByHenHouseID:henHouseID BWater:YES BFood:YES];
//    //给鸡喂水
//    DAState *waterState1 = [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:chickID BEat:NO HenHouseID:henHouseID Cost:2 Time:[DateTool Now]];
//    //给鸡喂食
//    DAState *foodState1 = [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:chickID BEat:YES HenHouseID:henHouseID Cost:2 Time:[DateTool Now]];
//    [[DAPlayerService sharePlayerService]AddWaterAndFoodByHenHouseID:henHouseID BWater:YES BFood:YES];
//    //幼年鸡长大为成年鸡
//    DAState *growUpState1 = [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:henHouseID TID:chickID TransDest:@"成年鸡"];
//    //给鸡喂水
//    DAState *waterState2 = [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:chickID BEat:NO HenHouseID:henHouseID Cost:2 Time:[DateTool Now]];
//    //给鸡喂食
//    DAState *foodState2 = [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:chickID BEat:YES HenHouseID:henHouseID Cost:2 Time:[DateTool Now]];
//    //鸡下蛋
//    DAState *layState = [[DAPlayerService sharePlayerService] PoultryLayInHenHouse:henHouseID TID:chickID];
//    //收获鸡蛋到仓库
//    DAState *getEggState = [[DAPlayerService sharePlayerService] AddProductItemToWareHouseByName:@"鸡蛋" ItemNum:1];
//    //成年鸡转换为成熟鸡
//    DAState *growUpState2 = [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:henHouseID TID:chickID TransDest:@"成熟鸡"];
//    //收获成熟鸡
//    DAState *getChick = [[DAPlayerService sharePlayerService] GetPoultryFromHenHouse:henHouseID TableID:chickID];
//    //更新成长时间
//   // DAState *actTime = [[DAPlayerService sharePlayerService] ChgPoultryActiveByTID:chickID ActiveTime:200];

    
}

-(void) goToUpgrade{
    [self removeChildByTag:101 cleanup:YES];
    [self removeChildByTag:71 cleanup:YES];
    [self removeChildByTag:46 cleanup:YES];
    updateItems = [[NSMutableArray alloc] init];
    updateNames = [[NSMutableArray alloc] init];
    shopPlayerService = [DAPlayerService sharePlayerService];
    
//    NSArray *familyNames = [UIFont familyNames];    
//    for( NSString *familyName in familyNames ){    
//        printf( "Family: %s \n", [familyName UTF8String] );    
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];    
//        for( NSString *fontName in fontNames ){    
//            printf( "\tFont: %s \n", [fontName UTF8String] );    
//        }    
//    }  
    
    CGSize viewSize = CGSizeMake(758, 510);
    updataView = [SWScrollView viewWithViewSize:viewSize];
    updataView.anchorPoint = ccp(0.5f, 0.5f);
    updataView.position = ccp(237, 161);
    updataView.contentOffset = ccp(0, 0);
    CGSize viewContentSize = CGSizeMake(758, 765);
    updataView.contentSize = viewContentSize;
    updataView.direction = SWScrollViewDirectionVertical;
    updataView.bounces = YES;
    [updataView setContentOffset:ccp(0,-255) animated:YES];
    
    int nPropCount=[[DAShopService shareShopService]shopData].ItemPropArr.count;
    
    for (int i = 0 ; i < nPropCount; i++) {
        DAShopService *shopService = [DAShopService shareShopService];
        DAItemProp *itemProp = [[DAItemService shareService] GetGeneralItemByName:[shopService.shopData.ItemPropArr objectAtIndex:i] GeneralItemType:GeneralItem_Prop];
        
        [updateNames addObject:itemProp.sysName];
        
        CCMenuItemImage *bottomButton = [CCMenuItemImage itemFromNormalImage:@"bottom_0.png" selectedImage:@"bottom_1.png" target:self selector:@selector(clickUpdateButton:)];
                
        CCLabelTTF *labelName = [CCLabelTTF labelWithString:itemProp.sysName fontName:@"FZHPJW--GB1-0" fontSize:18];
        labelName.color = ccWHITE;
        labelName.anchorPoint = ccp(0.5f, 0.5f);
        labelName.position = ccp(88, 195);
        [bottomButton addChild:labelName z:99];
        
        CCSprite *spritePic = [CCSprite spriteWithFile:itemProp.imagePath];
        spritePic.anchorPoint = ccp(0.5f, 0.5f);
        spritePic.position = ccp(88, 125);
        [bottomButton addChild:spritePic z:99];
        
        DAWareHouseService *wareHouse = [DAWareHouseService shareWareHouseService];
        if ([wareHouse FindPropItem:itemProp.sysName]) {
            CCLabelTTF *labelName = [CCLabelTTF labelWithString:@"已购买" fontName:@"FZHPJW--GB1-0" fontSize:20];
            labelName.color = ccYELLOW;
            labelName.anchorPoint = ccp(0.5f, 0.5f);
            labelName.position = ccp(93, 27);
            [bottomButton addChild:labelName z:99];
            bottomButton.isEnabled = YES;
        }else{
            CCSprite *spriteCoin = [CCSprite spriteWithFile:@"coin.png"];
            spriteCoin.anchorPoint = ccp(0.5f, 0.5f);
            spriteCoin.position = ccp(53, 27);
            [bottomButton addChild:spriteCoin z:99];
            
            CCSprite *spriteCoinBar = [CCSprite spriteWithFile:@"black shopbar.png"];
            spriteCoinBar.anchorPoint = ccp(0.5f, 0.5f);
            spriteCoinBar.position = ccp(93, 27);
            [bottomButton addChild:spriteCoinBar z:98];
            
            CCLabelAtlas *labelPriUpdate = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", itemProp.nBuyPrice] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
            labelPriUpdate.anchorPoint = ccp(0.5f, 0.5f);
            labelPriUpdate.position = ccp(105, 25);
            [labelPriUpdate setScale:0.75f];
            [bottomButton addChild:labelPriUpdate z:99];
        }
        
        
        for (int j = 0; j< 5; j++) {
            CCSprite *spriteBlackStar = [CCSprite spriteWithFile:@"Star_Black.png"];
            spriteBlackStar.anchorPoint = ccp(0.5f, 0.5f);
            spriteBlackStar.position = ccpAdd(ccp(30, 55), ccp((j * 30), 0));
            [bottomButton addChild:spriteBlackStar z:99];
        }
        
        switch (i%4) {
            case 0:
                for (int j = 0; j< 2; j++) {
                    CCSprite *spriteBlackStar = [CCSprite spriteWithFile:@"Star_1.png"];
                    spriteBlackStar.anchorPoint = ccp(0.5f, 0.5f);
                    spriteBlackStar.position = ccpAdd(ccp(30, 55), ccp((j * 30), 0));
                    [bottomButton addChild:spriteBlackStar z:99];
                }
                break;
            case 1:
                for (int j = 0; j< 3; j++) {
                    CCSprite *spriteBlackStar = [CCSprite spriteWithFile:@"Star_1.png"];
                    spriteBlackStar.anchorPoint = ccp(0.5f, 0.5f);
                    spriteBlackStar.position = ccpAdd(ccp(30, 55), ccp((j * 30), 0));
                    [bottomButton addChild:spriteBlackStar z:99];
                }
                break;
            case 2:
                for (int j = 0; j< 4; j++) {
                    CCSprite *spriteBlackStar = [CCSprite spriteWithFile:@"Star_1.png"];
                    spriteBlackStar.anchorPoint = ccp(0.5f, 0.5f);
                    spriteBlackStar.position = ccpAdd(ccp(30, 55), ccp((j * 30), 0));
                    [bottomButton addChild:spriteBlackStar z:99];
                }
                break;
            case 3:
                for (int j = 0; j< 5; j++) {
                    CCSprite *spriteBlackStar = [CCSprite spriteWithFile:@"Star_1.png"];
                    spriteBlackStar.anchorPoint = ccp(0.5f, 0.5f);
                    spriteBlackStar.position = ccpAdd(ccp(30, 55), ccp((j * 30), 0));
                    [bottomButton addChild:spriteBlackStar z:99];
                }
                break;
            default:
                break;
        }
        
        CCMenu *menu_bottom = [CCMenu menuWithItems:bottomButton, nil];
        [updateItems addObject:bottomButton];
        
        if (i>=0 && i<4) {
            menu_bottom.position = ccpAdd(ccp(98,(bottomButton.contentSize.height + 415)),ccp((i * (bottomButton.contentSize.width + 10)), 0));
        }else if(i>=4 && i<8){
            menu_bottom.position = ccpAdd(ccp(98,(bottomButton.contentSize.height + 170)),ccp(((i - 4) * (bottomButton.contentSize.width + 10)), 0));
        }else if(i>=8 && i<12){
            menu_bottom.position = ccpAdd(ccp(98,140),ccp(((i - 8) * (bottomButton.contentSize.width + 10)), 0));
        }
        
        [updataView addChild:menu_bottom z:90];
    }
    labelGoldBottom = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", shopPlayerService.playerEntity.nMoney] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
    labelGoldBottom.position = ccp(850, 77);
    labelGoldBottom.anchorPoint = ccp(1, 0.5);
    [self addChild:labelGoldBottom z:99 tag:71];
    
    
    [self addChild:updataView z:90 tag:101];
    
    //下方返回按钮
    CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goToMap)];
    
    CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
    menu_rightbottom.position = ccp(950, 80);
    [self addChild:menu_rightbottom z:99 tag:46];
}

-(void) goToTool{
    [self removeChildByTag:101 cleanup:YES];
    [self removeChildByTag:71 cleanup:YES];
    [self removeChildByTag:46 cleanup:YES];
    toolItems = [[NSMutableArray alloc] init];
    toolNames = [[NSMutableArray alloc] init];
    shopPlayerService = [DAPlayerService sharePlayerService];
    
    CGSize viewSize = CGSizeMake(758, 510);
    SWScrollView *toolView = [SWScrollView viewWithViewSize:viewSize];
    toolView.anchorPoint = ccp(0.5f, 0.5f);
    toolView.position = ccp(237, 161);
    toolView.contentOffset = ccp(0, 0);
    CGSize viewContentSize = CGSizeMake(758, 1530);
    toolView.contentSize = viewContentSize;
    toolView.direction = SWScrollViewDirectionVertical;
    toolView.bounces = YES;
    [toolView setContentOffset:ccp(0, -1020) animated:YES];
    
    int nPropCount=[[DAShopService shareShopService]shopData].ItemVehicleArr.count;
    for (int i = 0; i < nPropCount; i++) {
        DAShopService *shopService = [DAShopService shareShopService];
        DAItemVehicle *itemVehicle = [[DAItemService shareService] GetGeneralItemByName:[shopService.shopData.ItemVehicleArr objectAtIndex:i] GeneralItemType:GeneralItem_Vehicle];
        
        [toolNames addObject:itemVehicle.sysName];
        
        CCMenuItemImage *toolBar = [CCMenuItemImage itemFromNormalImage:@"toolbars_0.png" selectedImage:@"toolbars_1.png" target:self selector:@selector(clickToolButton:)];
        
        CCSprite *spriteTool = [CCSprite spriteWithFile:itemVehicle.imagePath];
        spriteTool.anchorPoint = ccp(0.5f, 0.5f);
        spriteTool.position = ccp(120, 100);
        [toolBar addChild:spriteTool z:99];
        
        CCSprite *spriteSpeed = [CCSprite spriteWithFile:@"speed.png"];
        spriteSpeed.anchorPoint = ccp(0.5f, 0.5f);
        spriteSpeed.position = ccp(300, 80);
        [toolBar addChild:spriteSpeed z:99];
        
        CCSprite *spriteAmount = [CCSprite spriteWithFile:@"amount.png"];
        spriteAmount.anchorPoint = ccp(0.5f, 0.5f);
        spriteAmount.position = ccp(565, 80);
        [toolBar addChild:spriteAmount z:99];
        
        CCLabelAtlas *labelSpeed = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", itemVehicle.nSpeed] charMapFile:@"speed number.png" itemWidth:24 itemHeight:29 startCharMap:'0'];
        labelSpeed.anchorPoint = ccp(0.5f, 0.5f);
        labelSpeed.position = ccp(380, 80);
        [toolBar addChild:labelSpeed z:99];
        
        CCLabelAtlas *labelAmount = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", (itemVehicle.nCapacity * itemVehicle.nBags)] charMapFile:@"amount number.png" itemWidth:24 itemHeight:29 startCharMap:'0'];
        labelAmount.anchorPoint = ccp(0.5f, 0.5f);
        labelAmount.position = ccp(655, 80);
        [toolBar addChild:labelAmount z:99];
        
        CCLabelTTF *labelName = [CCLabelTTF labelWithString:itemVehicle.sysName fontName:@"FZHPJW--GB1-0" fontSize:35];
        labelName.color = ccWHITE;
        labelName.anchorPoint = ccp(0.5f, 0.5f);
        labelName.position = ccp(320, 140);
        [toolBar addChild:labelName z:99];
        
        DAWareHouseService *wareHouse = [DAWareHouseService shareWareHouseService];
        if ([wareHouse FindVehicleItem:itemVehicle.sysName]) {
            CCLabelTTF *labelName = [CCLabelTTF labelWithString:@"已购买" fontName:@"FZHPJW--GB1-0" fontSize:30];
            labelName.color = ccYELLOW;
            labelName.anchorPoint = ccp(0.5f, 0.5f);
            labelName.position = ccp(645, 33);
            [toolBar addChild:labelName z:99];
            toolBar.isEnabled = YES;
        } else {
            if (itemVehicle.nBuyPrice < 1) {
                CCLabelTTF *labelName = [CCLabelTTF labelWithString:@"默认获得" fontName:@"FZHPJW--GB1-0" fontSize:30];
                labelName.color = ccYELLOW;
                labelName.anchorPoint = ccp(0.5f, 0.5f);
                labelName.position = ccp(645, 33);
                [toolBar addChild:labelName z:99];
                toolBar.isEnabled = NO;
            } else {
                CCSprite *spriteCoin = [CCSprite spriteWithFile:@"coin.png"];
                spriteCoin.anchorPoint = ccp(0.5f, 0.5f);
                spriteCoin.position = ccp(600, 35);
                [toolBar addChild:spriteCoin z:99 tag:53];
                
                CCSprite *spriteCoinBar = [CCSprite spriteWithFile:@"black shopbar.png"];
                spriteCoinBar.anchorPoint = ccp(0.5f, 0.5f);
                spriteCoinBar.position = ccp(655, 33);
                [toolBar addChild:spriteCoinBar z:98 tag:53];
                
                CCLabelAtlas *labelPri = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", itemVehicle.nBuyPrice] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
                labelPri.anchorPoint = ccp(0.5f, 0.5f);
                labelPri.position = ccp(660, 31);
                [labelPri setScale:0.75f];
                [toolBar addChild:labelPri z:99 tag:53];
            }
        }
        [toolItems addObject:toolBar];
        CCMenu *menu_bottom = [CCMenu menuWithItems:toolBar, nil];
        
        menu_bottom.position = ccpAdd(ccp(380, 1390), ccp(0, -(i * (toolBar.contentSize.height + 55))));
        
        [toolView addChild:menu_bottom z:99];
    }
    
    labelGoldBottom = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", shopPlayerService.playerEntity.nMoney] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
    labelGoldBottom.position = ccp(850, 77);
    labelGoldBottom.anchorPoint = ccp(1, 0.5);
    [self addChild:labelGoldBottom z:99 tag:71];
    
    [self addChild:toolView z:98 tag:101];
    
    //下方返回按钮
    CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goToMap)];
    
    CCMenu *menu_rightbottom = [CCMenu menuWithItems:backButton, nil];
    menu_rightbottom.position = ccp(950, 80);
    [self addChild:menu_rightbottom z:99 tag:46];
}

-(void) clickUpdateButton:sender{
    womanWarn = [[WomanWarning alloc] init];
    womanWarn._delegate = self;
    [self addChild:womanWarn z:99];
    
    for (CCMenuItemImage *menuItem in updateItems) {
        int nPropCount=[[DAShopService shareShopService]shopData].ItemPropArr.count;
        for (int i = 0; i < nPropCount; i++) {
            if (sender == [updateItems objectAtIndex:i]) {
                womanWarn.updateName = [updateNames objectAtIndex:i];
            }
        }
    }
    
    DAWareHouseService *wareHouseSwevice = [DAWareHouseService shareWareHouseService];
    if ([wareHouseSwevice FindPropItem:womanWarn.updateName]) {
        [womanWarn updateWarning];
    }else{
        [womanWarn buyUpdateWarning];
    }
    
    [womanWarn release];
}

-(void) clickToolButton:sender{
    womanWarn = [[WomanWarning alloc] init];
    womanWarn._delegate = self;
    [self addChild:womanWarn z:99];
    
    for (CCMenuItemImage *menuItem in toolItems) {
        int nPropCount=[[DAShopService shareShopService]shopData].ItemVehicleArr.count;
        for (int i = 0; i < nPropCount; i++) {
            if (sender == [toolItems objectAtIndex:i]) {
                womanWarn.toolName = [toolNames objectAtIndex:i];
            }
        }
    }
    
    DAWareHouseService *wareHouseSwevice = [DAWareHouseService shareWareHouseService];
    if ([wareHouseSwevice FindVehicleItem:womanWarn.toolName]) {
        [womanWarn toolWarning];
    }else{
        [womanWarn buyToolWarning];
    }
    
    [womanWarn release];
}

-(void) goToMap{
    CCScene *scene = [CCScene node];
	
	WorldLayer *worldLayer = [WorldLayer node];
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}

-(void)gold:(int)d
{
    [self removeChildByTag:71 cleanup:YES];
    if (d == 1) {
        labelGoldBottom = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", [DAPlayerService sharePlayerService].playerEntity.nMoney] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
        labelGoldBottom.position = ccp(850, 77);
        labelGoldBottom.anchorPoint = ccp(1, 0.5);
        [self addChild:labelGoldBottom z:99 tag:71];
    } else if (d ==2) {
        labelGoldBottom = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", [DAPlayerService sharePlayerService].playerEntity.nMoney] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:25 startCharMap:'0'];
        labelGoldBottom.position = ccp(850, 77);
        labelGoldBottom.anchorPoint = ccp(1, 0.5);
        [self addChild:labelGoldBottom z:99 tag:71];
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [updateItems release];
    updateItems = nil;
    [toolItems release];
    toolItems = nil;
	[super dealloc];
}

@end
